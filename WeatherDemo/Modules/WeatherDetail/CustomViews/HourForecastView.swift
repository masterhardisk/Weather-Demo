//
//  HourForecastView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//

import SwiftUI

struct HourForecastView: View {
    let hourForecast: [HourForecast]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.secondary)
                Text("hourly_forecast")
                    .foregroundColor(.secondary)
            }
                
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading){
                    
                    HStack {
                        ForEach(hourForecast) { forecast in
                            VStack (alignment: .center, spacing: 10){
                                Text(forecast.time.toHour())
                                    .foregroundColor(.white)
                                Image(systemName: forecast.description.weatherIcon)
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25, alignment: .center)
                                    .foregroundColor(.white)
                                    
                                Text(forecast.temp)
                                    .foregroundColor(.white)
                            }
                            .multilineTextAlignment(.center)
                            .padding()
                        }
                    }
                }
                
               
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}


#Preview {
    HourForecastView(hourForecast: [.test,.test,.test])
}
