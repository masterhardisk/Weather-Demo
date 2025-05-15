//
//  WttrApi.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//

import Foundation

class WttrApi: Api {
    func getWeatherBy(lat: String, lon: String) async throws -> CurrentWeather {
        return try await fetchData(from: WttrEndPoint.getWeatherBy(lat, lon), as: WeatherResponseDto.self).toCurrentWeather
    }
}
