//
//  CitiesApi.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//

import Foundation

class CitiesApi: Api {
    func getCitiesBy(_ city: String) async throws -> [City] {
        return try await fetchData(from: CitiesEndPoint.getCitiesBy(city), as: [CitySuggestionDto].self).map(\.toCity)
    }
}
