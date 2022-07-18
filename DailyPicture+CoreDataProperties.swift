//
//  DailyPicture+CoreDataProperties.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//
//

import Foundation
import CoreData


extension DailyPicture {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<DailyPicture> {
        return NSFetchRequest<DailyPicture>(entityName: "DailyPicture")
    }
    
    @NSManaged public var title: String?
    @NSManaged public var explaination: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var date: String?
    
}

extension DailyPicture : Identifiable {
    
}
