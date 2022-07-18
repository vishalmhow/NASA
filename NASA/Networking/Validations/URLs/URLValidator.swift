//
//  URLValidator.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol URLValidator {
    func validate(_ url: URL?) -> URL
}
