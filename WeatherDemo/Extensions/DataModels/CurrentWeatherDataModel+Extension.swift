//
//  CurrentWeatherDataModel+Extension.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//

extension CurrentWeatherDataModel {
    var toCurrentWeather: CurrentWeather {
        CurrentWeather(humidity: self.humidity,
                       windSpeed: self.windSpeed,
                       windDegrees: self.windDegrees,
                       windDirection: self.windDirection,
                       temp: self.temp,
                       hour: self.hour,
                       city: self.city,
                       description: self.weatherDescription,
                       originalDescription: self.originalDescription,
                       minMaxTemp: self.minMaxTemp,
                       lat: self.lat,
                       lon: self.lon,
                       feelTemp: self.feelTemp,
                       dailyForecast: [])
    }
}
