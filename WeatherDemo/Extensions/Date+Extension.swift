//
//  Date+Extension.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//
import Foundation

extension Date {
    func toHourString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
    
    func toDateString(daysFromNow: Int = 0) -> String {
        let futureDate = Calendar.current.date(byAdding: .day, value: daysFromNow, to: self) ?? self

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: futureDate)
    }
}
