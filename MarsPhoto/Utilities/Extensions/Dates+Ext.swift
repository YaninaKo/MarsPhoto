//
//  Dates+Ext.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import Foundation

extension Date {
    func convertToApiString() -> String {
        return "\(self.formatted(.dateTime.year()))-\(self.formatted(.dateTime.month(.defaultDigits)))-\(self.formatted(.dateTime.day(.defaultDigits)))"
    }

    func convertToMonthDayYearFormat() -> String {
        return formatted(.dateTime.day().month().year())
    }
}
