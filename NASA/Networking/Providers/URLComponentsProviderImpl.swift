//
//  URLComponentsProviderImpl.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal class URLComponentsProviderImpl : URLComponentsProvider {
    private var validator: URLComponentsValidator!
    
    init() {
        validator = URLComponentsValidatorImpl()
    }
    
    internal func get(queryType: QueryType) -> URLComponents {
        let urlCompoments = URLComponents(string: queryType.associatedData.baseURL)
        return validator.validate(urlCompoments)
    }
}
