//
//  DailyForecast.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//

import Foundation

struct DailyForecast: Hashable, Identifiable {
    let id = UUID()
    let temp: String
    let minTemp: String
    let maxTemp: String
    let date: String
    let hourForecasts: [HourForecast]
    
    init(temp: String, date: String, hourForecasts: [HourForecast], minTemp: String, maxTemp: String) {
        self.temp = temp
        self.date = date
        self.hourForecasts = hourForecasts
        self.minTemp = minTemp
        self.maxTemp = maxTemp
    }
}
