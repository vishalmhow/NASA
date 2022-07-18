//
//  EntityValidatorImpl.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal class EntityValidatorImpl : EntityValidator {
    internal func validate<Entity>(_ entity: Entity?) -> Entity where Entity : Decodable, Entity : Encodable {
        guard let validEntity = entity else {
            fatalError("Entity is nil")
        }
        return validEntity
    }
}
