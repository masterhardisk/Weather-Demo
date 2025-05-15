//
//  CurrentWeather+Extension.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//
import Foundation
import SwiftUICore

extension CurrentWeather {
    var toWeatherDataModel: CurrentWeatherDataModel {
        return CurrentWeatherDataModel(id: id,
                                       date: currentDate,
                                       humidity: humidity,
                                       windSpeed: windSpeed,
                                       windDegrees: windDegrees,
                                       windDirection: windDirection,
                                       temp: temp,
                                       hour: hour,
                                       city: city,
                                       weatherDescription: description,
                                       originalDescription: originalDescription,
                                       minMaxTemp: minMaxTemp,
                                       lat: lat,
                                       lon: lon,
                                       feelTemp: feelTemp)
    }
    
    static let test = CurrentWeather(humidity: "20%",
                                     windSpeed: "43",
                                     windDegrees: "10",
                                     windDirection: "N",
                                     temp: "14º",
                                     hour: Date().toHourString(),
                                     city: "El Castell",
                                     description: "Nieve",
                                     originalDescription: "snow",
                                     minMaxTemp: "Máx. 20º Mín. 10º",
                                     lat: "40.600",
                                     lon: "0.450",
                                     feelTemp: "-6º",
                                     dailyForecast: [.test])
}
