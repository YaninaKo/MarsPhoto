//
//  String+Ext.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import Foundation

extension String {
    func convertApiStringToDate() -> Date? {
        let strategy = Date.ParseStrategy(format: "\(year: .defaultDigits)-\(month: .twoDigits)-\(day: .twoDigits)", timeZone: TimeZone(abbreviation: "UTC")!)
        return try? Date(self, strategy: strategy)
    }

    func convertToMonthDayYearString() -> String? {
        return self.convertApiStringToDate()?.convertToMonthDayYearFormat()
    }
}
