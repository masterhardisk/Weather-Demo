//
//  HourlyWeatherDto.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//


struct HourlyWeatherDto: Codable {
    let FeelsLikeC: String
    let humidity: String
    let tempC: String
    let time: String
    let weatherDesc: [DefaultValueDto]
    let windspeedKmph: String
}
