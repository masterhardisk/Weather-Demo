//
//  WeatherDataManager.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//

import SwiftData
import Foundation

struct WeatherDataManager {
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func getAllWeathers() async throws -> [CurrentWeather]{
        let weathers = try self.context.fetch(FetchDescriptor<CurrentWeatherDataModel>())
        return weathers.map(\.toCurrentWeather)
    }
    
    func save(_ weather: CurrentWeather) async throws{
        let charactersStored = try await getAllWeathers()
        print(charactersStored.contains(where: { $0.id == weather.id }))
        if charactersStored.contains(where: { $0.id == weather.id }) {
            try await delete(weather)
        }
        context.insert(weather.toWeatherDataModel)
        try context.save()
    }
    
    func delete(_ weather: CurrentWeather) async throws{
        if let stored = try context.fetch(FetchDescriptor<CurrentWeatherDataModel>())
            .first(where: { $0.id == weather.id }) {
            context.delete(stored)
            try context.save()
        }
    }
}
