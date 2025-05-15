//
//  DailyForecast+Extension.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//

import Foundation

extension DailyForecast {
    static let test = DailyForecast(temp: "18º",
                                    date: Date().toDateString(daysFromNow: 1),
                                    hourForecasts: [.test, .test, .test, .test, .test],
                                    minTemp: "9",
                                    maxTemp: "27")
}
