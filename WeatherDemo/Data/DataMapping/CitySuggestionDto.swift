//
//  CitySuggestionDto.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//
import Foundation

struct CitySuggestionDto: Codable {
    let placeId: Int
    let displayName: String
    let name: String
    let lat: String
    let lon: String
    
}
