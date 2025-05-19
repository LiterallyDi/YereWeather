//
//  WeatherViewModel.swift
//  YereWeather
//
//  Created by Dianella on 19.05.25.
//

import Combine
import SwiftUI

final class WeatherViewModel: ObservableObject {
    @Published var forecast: [ForecastDay] = []

    private let weatherService = WeatherService()
    private var cancellables = Set<AnyCancellable>()

    func loadWeather(for city: String) {
        weatherService.fetchWeather(city: city)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("error", error)
                }
            }, receiveValue: { [weak self] days in
                self?.forecast = days
            })
            .store(in: &cancellables)
    }
}
