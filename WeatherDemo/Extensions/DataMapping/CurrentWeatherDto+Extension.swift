//
//  CurrentWeatherDto+Extension.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//
import Foundation

extension WeatherResponseDto {
    var toCurrentWeather: CurrentWeather {
        CurrentWeather(
            humidity: "\(self.currentCondition.first?.humidity ?? "")%",
            windSpeed: self.currentCondition.first?.windspeedKmph ?? "",
            windDegrees: self.currentCondition.first?.winddirDegree ?? "",
            windDirection: self.currentCondition.first?.winddir16Point ?? "",
            temp: "\(self.currentCondition.first?.tempC ?? "")º",
            hour: Date().toHourString(),
            city: self.nearestArea.first?.areaName.first?.value ?? "",
            description: localizedDescription(),
            originalDescription: self.currentCondition.first?.weatherDesc.first?.value ?? "",
            minMaxTemp: "Mín. \(self.weather.first?.mintempC ?? "")º Máx. \(self.weather.first?.maxtempC ?? "")º",
            lat: self.nearestArea.first?.latitude ?? "",
            lon: self.nearestArea.first?.longitude ?? "",
            feelTemp: "\(self.currentCondition.first?.FeelsLikeC ?? "")º",
            dailyForecast: self.weather.map(\.toDailyForecast))
    }
    
    func localizedDescription() -> String {
        let langCode = Locale.current.language.languageCode?.identifier ?? "en"
            
            switch langCode {
            case "es":
                return self.currentCondition.first?.langEs.first?.value ?? self.currentCondition.first?.weatherDesc.first?.value ?? ""
            default:
                return self.currentCondition.first?.weatherDesc.first?.value ?? ""
            }
        }
}
