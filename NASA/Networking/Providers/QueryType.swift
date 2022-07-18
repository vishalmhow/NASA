//
//  QueryType.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal enum QueryType : String {
    case pictureOfTheDay

    internal var associatedData: (baseURL: String, parameterName: String) {
        switch self {
        case .pictureOfTheDay:
            return ("https://api.nasa.gov/planetary/apod", "date")
        }
    }
}
