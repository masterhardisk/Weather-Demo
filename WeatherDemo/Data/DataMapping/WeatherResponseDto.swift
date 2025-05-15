//
//  WeatherResponseDto.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//
import Foundation

struct WeatherResponseDto: Codable {
    let currentCondition: [CurrentConditionDto]
    let nearestArea: [NearestAreaDto]
    let weather: [DailyWeatherDto]
}
