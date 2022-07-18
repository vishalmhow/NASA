//
//  DateParserValidatorImpl.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

internal class DateParserValidatorImpl : DateParserValidator {
    internal func validate(_ dateInString: String) -> String {
        if dateInString.isEmpty {
            fatalError("EMPTY DATE IN STRING")
        }
        return dateInString
    }
}
