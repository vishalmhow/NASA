//
//  URLQueryItemProvider.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol URLQueryItemProvider {
    func getAuthenticationItem() -> URLQueryItem
    func get(queryType: QueryType, date: Date) -> URLQueryItem
}
