//
//  WeatherListView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//
import SwiftUI
import SwiftData

struct WeatherListView: View {
    @State var homeViewModel: HomeViewModel
    
    init(context: ModelContext){
        homeViewModel = HomeViewModel(context: context)
    }
    
    var body: some View {
        NavigationStack {
            List {
                if homeViewModel.isSearching {
                    if homeViewModel.cities.isEmpty {
                        Text("no_results")
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                        } else {
                            ForEach(homeViewModel.cities) { city in
                                SearchView(city: city)
                                    .onTapGesture {
                                        Task {
                                            await homeViewModel.selected(city)
                                        }
                                    }
                            }
                        }
                }else {
                    ForEach(homeViewModel.weathers) { weather in
                        WeatherCardView(weather: weather)
                            .onTapGesture {
                                homeViewModel.selectedWeather = weather
                            }
                    }
                    .onDelete { indexSet in
                        Task {
                            await homeViewModel.deleteWeatherAt(indexSet)
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    
                }
            }
            .navigationTitle("Weather Demo")
            .searchable(text: $homeViewModel.query, isPresented: $homeViewModel.isSearching,prompt: "enter_a_city")
            .onChange(of: homeViewModel.query) {
                homeViewModel.toggleSearch(homeViewModel.query)
                Task {
                    await homeViewModel.fechCitiesDebounced(homeViewModel.query)
                }
            }
            .onAppear() {
                Task {
                    await homeViewModel.loadSavedWeathers()
                }
            }
            .refreshable {
                // Lógica para actualizar los datos
                await homeViewModel.loadSavedWeathers()
            }
            .sheet(item: $homeViewModel.selectedWeather, onDismiss: {
                homeViewModel.selectedWeather = nil
            }) { weather in
                WeatherDetailView(weather: weather)
            }
            .alert("application_error", isPresented: $homeViewModel.errorShow) { }
            message: {
                Text(homeViewModel.errorMessage)
            }
        }
    }
}

