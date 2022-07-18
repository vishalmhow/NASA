//
//  Serializer.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol Serializer {
    func decode<Entity>(ofType: Entity.Type, data: Data, completion: @escaping (Entity) -> Void) where Entity : Codable
}
