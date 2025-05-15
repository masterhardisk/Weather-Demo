//
//  HourForecast.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//
import Foundation

struct HourForecast: Hashable, Identifiable {
    let id = UUID()
    let temp: String
    let time: String
    let description: String
    
    init(temp: String,
         time: String,
         description: String) {
        self.temp = temp
        self.time = time
        self.description = description
    }
}
