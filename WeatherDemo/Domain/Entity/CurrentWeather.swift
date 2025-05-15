//
//  CurrentWeather.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//

import Foundation

struct CurrentWeather: Hashable, Identifiable{
    let id: String
    let currentDate: Date
    let humidity: String
    let windSpeed: String
    let windDegrees: String
    let windDirection: String
    let temp: String
    let hour: String
    let city: String
    let description: String
    let originalDescription: String
    let minMaxTemp: String
    let lat: String
    let lon: String
    let feelTemp: String
    let dailyForecast: [DailyForecast]
    
    init(humidity: String,
         windSpeed: String,
         windDegrees: String,
         windDirection: String,
         temp: String,
         hour: String,
         city: String,
         description: String,
         originalDescription: String,
         minMaxTemp: String,
         lat: String,
         lon: String,
         feelTemp: String,
         dailyForecast:[DailyForecast]) {
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windDegrees = windDegrees
        self.windDirection = windDirection
        self.temp = temp
        self.hour = hour
        self.city = city
        self.description = description
        self.originalDescription = originalDescription
        self.minMaxTemp = minMaxTemp
        self.lat = lat
        self.lon = lon
        self.id = "\(lat)\(lon)"
        self.feelTemp = feelTemp
        self.currentDate = Date()
        self.dailyForecast = dailyForecast
    }
}
