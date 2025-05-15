//
//  SwiftDataManager.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//


import SwiftData

@MainActor
class SwiftDataManager {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([CurrentWeatherDataModel.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}
