//
//  PersistenceServices.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation
import CoreData

final class PersistenceService {
    // MARK: - Core Data stack
    
    private init() {}
    static let shared = PersistenceService()
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "NASA")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func fetchManagedObject<T: NSManagedObject>(managedObject: T.Type) -> [T]?
    {
        do {
            guard let result = try PersistenceService.shared.context.fetch(managedObject.fetchRequest()) as? [T] else {return nil}
            
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
    func removeAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
}
