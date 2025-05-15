//
//  String+Extension.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//
import Foundation

extension String {
    func toHour() -> String {
        if let intVal = Int(self) {
            let hour = intVal / 100
            return String(format: "%01d", hour)
        }
        return self
    }
    
    func toDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date ?? Date())
    }
    
    var weatherIcon: String {
        switch self.description.lowercased() {
        case let desc where desc.contains("rain"),
            let desc where desc.contains("thunder"):
            "cloud.drizzle.fill"
        case let desc where desc.contains("snow"):
            "cloud.snow.fill"
        case let desc where desc.contains("cloud"):
            "cloud.sun.fill"
        case let desc where desc.contains("overcast"):
            "cloud.fill"
        case let desc where desc.contains("sunny"), let desc where desc.contains("clear"):
            "sun.max.fill"
        default:
            "sun.max.fill"
        }
    }
}
