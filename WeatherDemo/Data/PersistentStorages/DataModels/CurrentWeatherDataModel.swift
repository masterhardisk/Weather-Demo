//
//  CurrentWeatherDataModel.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//
import SwiftData
import SwiftUICore

@Model
final class CurrentWeatherDataModel {
    var id: String
    var date: Date
    var humidity: String
    var windSpeed: String
    var windDegrees: String
    var windDirection: String
    var temp: String
    var hour: String
    var city: String
    var weatherDescription: String
    var originalDescription: String
    var minMaxTemp: String
    var lat: String
    var lon: String
    var feelTemp: String
    
    init(id: String,
         date: Date,
         humidity: String,
         windSpeed: String,
         windDegrees: String,
         windDirection: String,
         temp: String,
         hour: String,
         city: String,
         weatherDescription: String,
         originalDescription: String,
         minMaxTemp: String,
         lat: String,
         lon: String,
         feelTemp: String) {
        self.id = id
        self.date = date
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windDegrees = windDegrees
        self.windDirection = windDirection
        self.temp = temp
        self.hour = hour
        self.city = city
        self.weatherDescription = weatherDescription
        self.originalDescription = originalDescription
        self.minMaxTemp = minMaxTemp
        self.lat = lat
        self.lon = lon
        self.feelTemp = feelTemp
    }
}
