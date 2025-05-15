//
//  WeatherDetailView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//
import SwiftUI

struct WeatherDetailView: View {
    let weather: CurrentWeather

    var body: some View {
        ZStack {
            WeatherBackground(description: weather.originalDescription, isFullScreen: true)

            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    VStack {
                        Text(weather.city)
                            .font(.title)
                            .foregroundColor(.white)
                        Text(weather.temp)
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                        Text(weather.description)
                            .foregroundColor(.white)
                        Text(weather.minMaxTemp)
                            .foregroundColor(.white)
                            .opacity(0.7)
                        
                        VStack {
                            HourForecastView(hourForecast: weather.dailyForecast.first?.hourForecasts ?? [])
                            
                            DailyForecastView(forecast: weather.dailyForecast)
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                                DefaultView(title: String(localized: "feels_like"), content: weather.feelTemp, icon: "thermometer.medium")
                                DefaultView(title:String(localized: "humidity"), content: weather.humidity, icon: "humidity.fill")
                            }
                            
                            WindView(directionText: weather.windDirection, directionDegrees: weather.windDegrees, speed: weather.windSpeed)
                        }
                        .padding(.top, 40)
                        Spacer()
                    }
                }
            }
            .padding(.top, 60)
            .padding()
        }
        .presentationDetents([.large])
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    WeatherDetailView(weather: .test)
}
