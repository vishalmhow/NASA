//
//  EntityValidator.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol EntityValidator {
    func validate<Entity>(_ entity: Entity?) -> Entity where Entity : Codable
}
