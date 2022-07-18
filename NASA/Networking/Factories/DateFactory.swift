//
//  DateFactory.swift
//  NASA
//
//  Created by Vishal22 Sharma on 17/07/22.
//

import Foundation

protocol DateFactory {
    func create(year: Int, month: Int, day: Int) -> Date
}
