//
//  FavouriteViewModel.swift
//  NASA
//
//  Created by Vishal22 Sharma on 18/07/22.
//

import Foundation
import UIKit

class FavouriteViewModel {
    private var activityIndicator: UIActivityIndicatorView!
    let pictureRepository: PictureRepository = PictureRepositoryImpl()
    var selectedPicture: DailyPicture?
    typealias serviceHandler = ((Bool, Error?) -> Void)
    var downloadImage: UIImage?
    private var imageDownloadService: ImageDownloadService = ImageDownloadServiceImpl()
    
    func setupImage(viewController: UIViewController,completion: @escaping(serviceHandler)) {
        self.runActivityIndicator(viewController)
        if let imageUrl = self.selectedPicture?.imageUrl {
            _ = imageDownloadService.runDownload(link: imageUrl) { [unowned self] image in
                downloadImage = image
                self.stopActivityIndicator()
                completion(true, nil)
            }
        }
    }
    
    func removeFavourite(completion: @escaping(serviceHandler)) {
        if let dailyPicture = self.selectedPicture {
            pictureRepository.removeFavourite(picture: dailyPicture) { status in
                completion(true, nil)
            }
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
