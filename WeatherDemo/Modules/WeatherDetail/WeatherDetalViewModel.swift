//
//  WeatherDetalViewModel.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//

import Foundation
import SwiftUI

@Observable
final class WeatherDetalViewModel: HandleError {
    var globalMin: Double = 0
    var globalMax: Double = 1
    
    func calculateGlobals(forecast: [DailyForecast]){
        globalMin = forecast.compactMap { Double($0.minTemp) }.min() ?? 0
        globalMax = forecast.compactMap { Double($0.maxTemp) }.max() ?? 1
    }
}
