//
//  FavouriteListViewModel.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

class FavouriteListViewModel {
    let pictureRepository: PictureRepository = PictureRepositoryImpl()
    var favoritesArray: [DailyPicture] = []
    
    func getFavouriteList(completion: @escaping (Bool) -> Void) {
        self.pictureRepository.getAll { favList in
            self.favoritesArray = favList
            completion(true)
        }
    }
}
