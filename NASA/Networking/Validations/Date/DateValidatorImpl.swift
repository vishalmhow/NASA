//
//  DateValidatorImpl.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal class DateValidatorImpl : DateValidator {
    internal func validate(dateComponents: DateComponents, calendar: Calendar) -> DateComponents {
        if dateComponents.isValidDate(in: calendar) == false {
            fatalError("INVALID DATE COMPONENTS")
        }
        return dateComponents
    }
    
    internal func validate(_ date: Date?) -> Date {
        guard let validDate = date else {
            fatalError("INVALID DATE")
        }
        return validDate
    }
}
