//
//  JSONSerializer.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal class JSONSerializer : Serializer {
    private var modelValidator: EntityValidator!
    
    init() {
        modelValidator = EntityValidatorImpl()
    }
    
    func decode<Entity>(ofType: Entity.Type, data: Data, completion: @escaping (Entity) -> Void) where Entity : Codable {
        DispatchQueue.global(qos: .utility).async {
            let resultEntity = try? JSONDecoder().decode(ofType.self, from: data)
            let validEntity = self.modelValidator.validate(resultEntity)
            DispatchQueue.main.async {
                completion(validEntity)
            }
        }
    }
}
