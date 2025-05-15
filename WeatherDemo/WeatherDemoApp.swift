//
//  WeatherDemoApp.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//

import SwiftUI
import SwiftData

@main
struct WeatherDemoApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(SwiftDataManager().sharedModelContainer)
    }
}
