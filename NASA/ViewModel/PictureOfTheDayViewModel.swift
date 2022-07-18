//
//  PictureOfTheDayViewModel.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation
import UIKit

class PictureOfTheDayViewModel {
    private var downloader: DataDownloadService = NASADownloadService()
    private var serializer: Serializer = JSONSerializer()
    private var imageDownloadService: ImageDownloadService = ImageDownloadServiceImpl()
    let pictureRepository: PictureRepository = PictureRepositoryImpl()
    private var activityIndicator: UIActivityIndicatorView!
    
    var lastDownloadedPictureOfTheDay: PictureOfTheDay!
    var downloadImage: UIImage?
    
    private var sendPicture: [String: PictureOfTheDay?]?
    private let PARAMETER_NAME = "picture"
    typealias serviceHandler = ((Bool, Error?) -> Void)
    func getCurrentDate() -> Date {
        return Date().addingTimeInterval(-2 * 60 * 60 * 8)
    }
    
    func downloadJSONfromServer(viewController: UIViewController,date: Date, completion: @escaping(serviceHandler)) {
        self.runActivityIndicator(viewController)
        _ = downloader.runDownload(date: date, queryType: .pictureOfTheDay) { [unowned self] data in
            self.serializer.decode(ofType: PictureOfTheDay.self, data: data) { [unowned self] pictureOfTheDay in
                self.lastDownloadedPictureOfTheDay = pictureOfTheDay
                setupImage(pictureOfTheDay) { (_, _) in
                    self.stopActivityIndicator()
                    completion(true, nil)
                }
            }
        }
    }
    func markAsFavourite(completion: @escaping(serviceHandler)) {
        self.pictureRepository.create(picture: self.lastDownloadedPictureOfTheDay) { status in
            if status {
                completion(true, nil)
            }
        }
    }
    private func setupImage(_ picture: PictureOfTheDay, completion: @escaping(serviceHandler)) {
        _ = imageDownloadService.runDownload(link: picture.url) { [unowned self] image in
            downloadImage = image
            completion(true, nil)
        }
    }
    func getButtonStates(completion: @escaping (Bool, Bool) -> Void) {
        self.pictureRepository.getAll { favList in
            // self.favoritesArray = favList
            completion(favList.count > 0, !favList.contains(where: {$0.imageUrl == self.lastDownloadedPictureOfTheDay.url}))
        }
    }
    
    func runActivityIndicator(_ uiView: UIViewController) {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        activityIndicator.center = uiView.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        uiView.view.addSubview(activityIndicator)
    }
    private func stopActivityIndicator() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [unowned self] in
            self.activityIndicator.stopAnimating()
        }
    }
}
