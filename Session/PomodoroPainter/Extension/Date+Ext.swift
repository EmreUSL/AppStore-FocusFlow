//
//  Date+Ext.swift
//  PomodoroPainter
//
//  Created by emre usul on 10.04.2023.
//

import Foundation

extension Date {
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .iso8601)
        
        guard let monday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return monday
    }
    
    var startOfWeeks: Date? {
        let gregorian = Calendar(identifier: .iso8601)
        guard let startDay = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 0, to: startDay)
    }
    
    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .iso8601)
        guard let startDay = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 6, to: startDay)
    }
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: self)
        
    }
}
