//
//  PictureRepository.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol PictureRepository {
    func create(picture: PictureOfTheDay, completion: @escaping (Bool) -> Void)
    func getAll(completion: @escaping ([DailyPicture]) -> Void)
    func deleteAllData()
    func removeFavourite(picture: DailyPicture, completion: @escaping (Bool) -> Void)
}
