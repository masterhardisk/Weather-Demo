//
//  WeatherBackground.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//
import SwiftUI

struct WeatherBackground: View {
    let description: String
    var isFullScreen: Bool = false
    
    var body: some View {
        switch description.lowercased() {
        case let desc where desc.contains("rain"),
             let desc where desc.contains("thunder"):
            RainView(isFullScreen: isFullScreen)
                .ignoresSafeArea()
            
        case let desc where desc.contains("snow"):
            SnowView(isFullScreen: isFullScreen)
                .ignoresSafeArea()
            
        case let desc where desc.contains("cloud"):
            CloudView(isFullScreen: isFullScreen)
                .ignoresSafeArea()
            
        case let desc where desc.contains("overcast"):
            OvercastView(isFullScreen: isFullScreen)
                .ignoresSafeArea()
            
        case let desc where desc.contains("sunny"),
             let desc where desc.contains("clear"):
            SunView(isFullScreen: isFullScreen)
                .ignoresSafeArea()
            
        default:
            SunView(isFullScreen: isFullScreen)
                .ignoresSafeArea()
        }
    }
}
