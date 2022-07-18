//
//  DateParser.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol DateParser {
    func parseToString(date: Date) -> String
    func parseToString(date: Date, format: String) -> String
}
