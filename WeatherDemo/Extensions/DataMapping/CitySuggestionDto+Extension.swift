//
//  CitySuggestionDto+Extension.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//

extension CitySuggestionDto {
    var toCity: City {
        City(id: self.placeId,
             name: self.name,
             displayName: self.displayName,
             lat: self.lat,
             lon: self.lon)
    }
}
