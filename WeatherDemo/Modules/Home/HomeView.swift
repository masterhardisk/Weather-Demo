//
//  HomeView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var homeViewModel: HomeViewModel? = nil
    
    var body: some View {
        NavigationStack {
            WeatherListView(context: modelContext)
        }
    }
}

#Preview {
    HomeView()
}
