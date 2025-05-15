//
//  CurrentConditionDto.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//
import Foundation

struct CurrentConditionDto: Codable {
    let humidity: String
    let tempC: String
    let windspeedKmph: String
    let winddir16Point: String
    let winddirDegree: String
    let FeelsLikeC: String
    let weatherDesc: [DefaultValueDto]
    let langEs: [DefaultValueDto]
}
