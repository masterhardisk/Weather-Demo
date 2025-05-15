//
//  TestModelContextFactory.swift.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//
import SwiftData
@testable import WeatherDemo

struct TestModelContextFactory {
    static func ModelContext() throws -> ModelContext {
        let schema = Schema([CurrentWeatherDataModel.self])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [configuration])
        return SwiftData.ModelContext(container)
    }
}
