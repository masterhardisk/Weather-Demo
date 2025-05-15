//
//  CitiesEndPoint.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//
import Foundation

enum CitiesEndPoint: ApiEndPoint {
    case getCitiesBy(_ query: String)
    
    private var baseURL: URL {
        return URL(string: "https://nominatim.openstreetmap.org")!
    }
    
    var url: URL {
        switch self {
        case .getCitiesBy(let query):
            let url = baseURL.appendingPathComponent("/search")
                .appending(queryItems: [URLQueryItem(name: "city", value: "\(query)")])
                .appending(queryItems: [URLQueryItem(name: "format", value: "json")])
                .appending(queryItems: [URLQueryItem(name: "limit", value: "10")])
            
            var request = URLRequest(url: url)
            request.setValue("iOSApp/1.0 (gerardcontador9@gmail.com)", forHTTPHeaderField: "User-Agent")
            
            return request.url!
        }
    }
}
