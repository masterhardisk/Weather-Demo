//
//  WeatherRespositoryTest.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//
import Testing
@testable import WeatherDemo

@Suite("Test of weather repository", .tags(.repository))
struct WeatherRespositoryTest {
    var repository: WeatherRepository
    
    init() throws {
        let context = try TestModelContextFactory.ModelContext()
        self.repository = WeatherRepository(context: context)
    }
    
    @Test
    func getCurrentWeatherTest() async throws {
        let lat = "40.600"
        let lon = "0.450"
        let weather = try await repository.getCurrentWeatherBy(lat, lon)
        #expect(weather.lat == lat && weather.lon == lon)
    }
}
