//
//  SearchView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//

import SwiftUI

struct SearchView: View {
    let city: City
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(city.displayName)
                .font(.headline)
                .padding(10)
        }
    }
}

#Preview {
    SearchView(city: .test)
}
