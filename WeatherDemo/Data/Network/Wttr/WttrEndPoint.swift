//
//  ApiEndPoint.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//

import Foundation

enum WttrEndPoint: ApiEndPoint {
    case getWeatherBy(_ lat: String, _ lon: String)
    
    private var baseURL: URL {
        return URL(string: "https://wttr.in")!
    }
    
    var url: URL {
        switch self {
        case .getWeatherBy(let lat, let lon):
            return baseURL.appendingPathComponent("/~\(lat),\(lon)")
                .appending(queryItems: [
                    URLQueryItem(name: "format", value: "j1"),
                    URLQueryItem(name: "lang", value: "es")
                                       ])
        }
    }
}
