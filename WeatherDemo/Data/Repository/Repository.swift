//
//  Repository.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//


import Foundation

class Repository {
    internal var wttrApi: WttrApi { WttrApi() }
    internal var citiesApi: CitiesApi { CitiesApi() }
}
