//
//  URLComponentsValidatorImpl.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal class URLComponentsValidatorImpl : URLComponentsValidator {
    internal func validate(_ urlComponents: URLComponents?) -> URLComponents {
        guard let validURLComponents = urlComponents else {
            fatalError("INVALID URL COMPONENTS OBJECT \(String(describing: urlComponents))")
        }
        return validURLComponents
    }
}
