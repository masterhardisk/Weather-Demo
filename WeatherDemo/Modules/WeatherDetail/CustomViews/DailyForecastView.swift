//
//  DailyForecastView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//
import SwiftUI

struct DailyForecastView: View {
    @State private var weatherDetalViewModel = WeatherDetalViewModel()
    let forecast: [DailyForecast]
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.secondary)
                Text("\(forecast.count, specifier: "forecast_days")")
                    .foregroundColor(.secondary)
            }
                
            Grid(horizontalSpacing: 12, verticalSpacing: 8) {
                ForEach(forecast) { weather in
                    GridRow {
                        Text(weather.date.toDay())
                            .foregroundColor(.white)
                            .gridColumnAlignment(.leading)
                        
                        Image(systemName: forecast.description.weatherIcon)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fill)
                            .frame(alignment: .center)
                            .padding(.horizontal, 30)
                        
                        HStack {
                            Text(weather.minTemp)
                                .foregroundColor(.secondary)
                            
                            BarForecastView(globalMin: weatherDetalViewModel.globalMin, globalMax: weatherDetalViewModel.globalMax, min: weather.minTemp, max: weather.maxTemp)
                            
                            Text(weather.maxTemp)
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(5)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(.ultraThinMaterial.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .onAppear() {
            weatherDetalViewModel.calculateGlobals(forecast: forecast)
        }
    }
}


#Preview {
    DailyForecastView(forecast: [DailyForecast(temp: "20º",
                                               date: "2025-05-14",
                                               hourForecasts: [],
                                               minTemp: "1º",
                                               maxTemp: "60º"),
                                 .test,
                                 DailyForecast(temp: "20º",
                                               date: "2025-05-17",
                                               hourForecasts: [],
                                               minTemp: "1º",
                                               maxTemp: "60º"),
                                 DailyForecast(temp: "20º",
                                               date: "2025-05-18",
                                               hourForecasts: [],
                                               minTemp: "6º",
                                               maxTemp: "27º")])
}
