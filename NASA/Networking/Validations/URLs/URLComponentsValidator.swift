//
//  URLComponentsValidator.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol URLComponentsValidator {
    func validate(_ urlComponents: URLComponents?) -> URLComponents
}
