//
//  HourlyWeatherDto+Extension.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//
import Foundation

extension HourlyWeatherDto {
    var toHourForecast: HourForecast {
        HourForecast(temp: "\(tempC)º",
                     time: time,
                     description: weatherDesc.first?.value ?? "")
    }
}
