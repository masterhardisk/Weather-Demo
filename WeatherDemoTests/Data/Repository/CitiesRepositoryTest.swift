//
//  CitiesRepositoryTest.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//
import Testing
@testable import WeatherDemo

@Suite("Test of Repository of Cities", .tags(.repository))
struct CitiesRepositoryTest {
    let repository = CitiesRepository()
    
    @Test
    func getCitiesTest() async throws {
        let cities = try await repository.getCitiesBy("Ulldecona")
        #expect(cities.count > 0)
    }
}
