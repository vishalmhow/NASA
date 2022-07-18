//
//  DateValidator.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol DateValidator {
    func validate(dateComponents: DateComponents, calendar: Calendar) -> DateComponents
    func validate(_ date: Date?) -> Date
}
