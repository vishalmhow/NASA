//
//  URLQueryItemProviderImpl.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal class URLQueryItemProviderImpl : URLQueryItemProvider {
    private var dateParser: DateParser!
    private let API_KEY = "Cz7Hc4JKsNIhWU95U7oW2bn8Rqcdefxw3QNOF37j"
    private let PARAMETER_NAME = "api_key"
    
    init() {
        dateParser = DateParserImpl()
    }
    
    internal func getAuthenticationItem() -> URLQueryItem {
        return URLQueryItem(name: PARAMETER_NAME, value: API_KEY)
    }
    
    internal func get(queryType: QueryType, date: Date) -> URLQueryItem {
        return URLQueryItem(name: queryType.associatedData.parameterName, value: dateParser.parseToString(date: date))
    }
}
