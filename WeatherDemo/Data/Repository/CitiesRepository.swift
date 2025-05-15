//
//  CitiesRepository.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//

class CitiesRepository: Repository {
    func getCitiesBy(_ query: String) async throws -> [City] {
        return try await citiesApi.getCitiesBy(query)
    }
}
