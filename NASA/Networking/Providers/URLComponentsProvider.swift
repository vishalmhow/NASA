//
//  URLComponentsProvider.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol URLComponentsProvider {
    func get(queryType: QueryType) -> URLComponents
}
