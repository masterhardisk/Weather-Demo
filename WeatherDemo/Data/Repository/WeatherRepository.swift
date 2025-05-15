//
//  WeatherRepository.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//
import SwiftData

class WeatherRepository: Repository {
    private let dataManager: WeatherDataManager
    
    init(context: ModelContext) {
        self.dataManager = WeatherDataManager(context: context)
    }
    
    func getCurrentWeatherBy(_ lat: String, _ lon: String) async throws -> CurrentWeather {
        let weather = try await wttrApi.getWeatherBy(lat: lat, lon: lon)
        try await dataManager.save(weather)
        return weather
    }
    
    func deleteCurrentWeather(_ weather: CurrentWeather) async throws {
        try await dataManager.delete(weather)
    }
    
    func getAllSavedWeather() async throws -> [CurrentWeather] {
        return try await dataManager.getAllWeathers().sorted(by: { $0.id > $1.id })
    }
}
