//
//  HomeViewModelTest.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//
import Foundation
import Testing
import SwiftData
@testable import WeatherDemo

enum TestError: Error {
    case failure(String)
}


@Suite("Test of home viewModel", .tags(.viewModel))
struct HomeViewModelTest {
    let context: ModelContext
    let viewModel: HomeViewModel
    
    init () throws {
        self.context = try TestModelContextFactory.ModelContext()
        self.viewModel = HomeViewModel(context: context)
    }
    
    @Test
    func performSearchTest() async throws {
        await viewModel.performSearch(query: "ulldecona")
        #expect(!viewModel.cities.isEmpty)
    }
    
    @Test
    func getWeatherTest() async throws {
        await viewModel.performSearch(query: "ulldecona")
        
        guard let city = viewModel.cities.first else {
            throw TestError.failure("No cities found after search.")
        }
        
        await viewModel.selected(city)
        #expect(!viewModel.weathers.isEmpty)
    }
    
    @Test
    func deleteWeatherTst() async throws {
        let indexSet: IndexSet = [0]
        self.context.insert(CurrentWeather.test.toWeatherDataModel)
        await viewModel.loadSavedWeathers()
        #expect(!viewModel.weathers.isEmpty)
        
        await viewModel.deleteWeatherAt(indexSet)
        #expect(viewModel.weathers.isEmpty)
    }
    
    @Test
    func getAllWeathersTest() async throws {
        self.context.insert(CurrentWeather.test.toWeatherDataModel)
        await viewModel.loadSavedWeathers()
        #expect(!viewModel.weathers.isEmpty)
    }
    
}
