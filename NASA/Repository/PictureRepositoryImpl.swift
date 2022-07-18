//
//  PictureRepositoryImpl.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation
import CoreData

struct PictureRepositoryImpl: PictureRepository {
    
    // MARK: Create entries in Entity
    func create(picture: PictureOfTheDay, completion: @escaping (Bool) -> Void) {
        let dailyPicture = DailyPicture(context: PersistenceService.shared.context)
        dailyPicture.title = picture.title
        dailyPicture.imageUrl = picture.url
        dailyPicture.explaination = picture.explanation
        dailyPicture.date = picture.date
        PersistenceService.shared.saveContext()
        completion(true)
    }
    // MARK: Fetch data from Entity
    func getAll(completion: @escaping ([DailyPicture]) -> Void) {
        
        let result = PersistenceService.shared.fetchManagedObject(managedObject: DailyPicture.self)
        
        completion(result ?? [])
    }
    // MARK: Removing data from entity
    func deleteAllData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "DailyPicture")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try PersistenceService.shared.context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                PersistenceService.shared.context.delete(objectData)
            }
        } catch let error {
            print(error)
        }
    }
    // MARK: Removing specific record from Entity
    func removeFavourite(picture: DailyPicture, completion: @escaping (Bool) -> Void) {
        
        PersistenceService.shared.context.delete(picture)
        PersistenceService.shared.saveContext()
        completion(true)
    }
}
