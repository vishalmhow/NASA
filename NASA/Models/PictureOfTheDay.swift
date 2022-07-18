//
//  PictureOfTheDay.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal struct PictureOfTheDay : Codable {
    let date: String
    let explanation: String
    let hdurl: String
    let media_type: String
    let service_version: String
    let title: String
    let url: String
}
