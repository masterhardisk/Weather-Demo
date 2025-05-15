//
//  NearestAreaDto.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//
import Foundation

struct NearestAreaDto: Codable {
    let areaName: [DefaultValueDto]
    let latitude: String
    let longitude: String
}
