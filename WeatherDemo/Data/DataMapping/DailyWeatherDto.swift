//
//  DailyWeatherDto.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//
import Foundation

struct DailyWeatherDto: Codable {
    let avgtempC: String
    let date: String
    let hourly: [HourlyWeatherDto]
    let maxtempC: String
    let mintempC: String
}
