//
//  ApiError.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//


enum ApiError: Error {
    case notFound
    case networkError
    
    var message: String {
        switch self {
        case .notFound:
            return "city_not_found"
        case .networkError:
            return "network_error"
        }
    }
}
