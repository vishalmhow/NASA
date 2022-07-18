//
//  URLFactory.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol URLFactory {
    func createRequest(queryType: QueryType, date: Date) -> URL
    func createRequest(link: String) -> URL
}
