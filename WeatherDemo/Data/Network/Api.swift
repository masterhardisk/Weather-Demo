//
//  Api.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//
import Foundation

class Api {
    internal func fetchData<T: Codable>(from: ApiEndPoint, as type: T.Type) async throws -> T {
        print(from.url)
        let (data, response) = try await URLSession.shared.data(from: from.url)
        try handleErrorFrom(response)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        let dataDecoded = try decoder.decode(T.self, from: data)
        return dataDecoded
    }
    
    private func handleErrorFrom(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else { throw ApiError.networkError }
        if httpResponse.statusCode == 404 {
            throw ApiError.notFound
        }
    }
}
