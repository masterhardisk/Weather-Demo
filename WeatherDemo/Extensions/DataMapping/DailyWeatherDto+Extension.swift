//
//  DailyWeatherDto+Extension.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//
import Foundation

extension DailyWeatherDto {
    var toDailyForecast: DailyForecast {
        DailyForecast(temp: "\(avgtempC)º",
                      date: date,
                      hourForecasts: hourly.map(\.toHourForecast),
                      minTemp: "\(mintempC)",
                      maxTemp: "\(maxtempC)")
    }
}
