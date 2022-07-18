//
//  DateFactoryImpl.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal class DateFactoryImpl : DateFactory {
    private var dateValidator: DateValidator!
    private let CALENDAR_TYPE = Calendar.Identifier.gregorian
    private let OFFSET = 2
    
    init() {
        dateValidator = DateValidatorImpl()
    }
    
    public func create(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar.init(identifier: CALENDAR_TYPE)
        let timeZone = TimeZone(secondsFromGMT: OFFSET)
        let dateComponents = DateComponents(calendar: calendar, timeZone: timeZone, year: year, month: month, day: day)
        let validDateComponents = dateValidator.validate(dateComponents: dateComponents, calendar: calendar)
        return dateValidator.validate(validDateComponents.date)
    }
}
