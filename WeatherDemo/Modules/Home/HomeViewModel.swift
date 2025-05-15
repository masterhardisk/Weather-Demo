//
//  HomeViewModel.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 12/5/25.
//
import Foundation
import SwiftUI
import SwiftData


@Observable
final class HomeViewModel: HandleError {
    let weatherRespository: WeatherRepository
    let citiesRepository: CitiesRepository = CitiesRepository()
    
    private var debounceTask: Task<Void, Never>?
    
    var weathers: [CurrentWeather] = []
    var cities: [City] = []
    var selectedWeather: CurrentWeather? = nil
    var query: String = ""
    var isSearching = false
    
    
    init(context: ModelContext){
        self.weatherRespository = WeatherRepository(context: context)
    }
    
    
    func fechCitiesDebounced(_ query: String) async {
        debounceTask?.cancel()
        debounceTask = Task { [query] in
            try? await Task.sleep(nanoseconds: 400_000_000) // 0.4 segundos
            guard !Task.isCancelled else { return }
            await self.performSearch(query: query)
        }
    }
    
    func performSearch(query: String) async {
        do {
            guard !query.isEmpty else {
                cities = []
                return
            }
            cities = try await citiesRepository.getCitiesBy(query)
        } catch let error as ApiError {
            showError(message: error.message)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func selected(_ city: City) async {
        do {
            if !weathers.contains(where: { $0.city.lowercased() == city.name.lowercased() }) {
                let weather = try await weatherRespository.getCurrentWeatherBy(city.lat, city.lon)
                weathers.insert(weather, at: 0)
            }
            query = ""
            toggleSearch(query)
        }
        catch let error as ApiError {
            showError(message: error.message)
        } catch {
            showError(message: error.localizedDescription)
        }
    }
    
    func deleteWeatherAt(_ indexSet: IndexSet) async {
        do {
            for index in indexSet {
                try await weatherRespository.deleteCurrentWeather(weathers[index])
                weathers.remove(at: index)
            }
        }catch let error as ApiError {
            showError(message: error.message)
            print(error)
        } catch {
            showError(message: error.localizedDescription)
            print(error.localizedDescription)
        }
    }
    
    func loadSavedWeathers() async {
        do {
            weathers = try await weatherRespository.getAllSavedWeather()
            
            for stored in weathers {
                let updatedWeather = try await weatherRespository.getCurrentWeatherBy(stored.lat, stored.lon)
                
                if let index = weathers.firstIndex(where: { $0.id == stored.id }) {
                    weathers[index] = updatedWeather
                }
            }
        } catch let error as ApiError {
            showError(message: error.message)
        } catch {
            showError(message: error.localizedDescription)
        }
    }
    
    func toggleSearch(_ query: String) {
        isSearching = !query.isEmpty
    }
}

