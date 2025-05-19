//
//  WeatherService.swift
//  YereWeather
//
//  Created by Dianella on 19.05.25.
//

import Combine
import SwiftUI

final class WeatherService {
    private let apiKey = "3406ab235a3c4b75ab2163029251905"

    func fetchWeather(city: String) -> AnyPublisher<[ForecastDay], Error> {
        let urlString = "https://api.weatherapi.com/v1/forecast.json?q=\(city)&days=5&key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ForecastResponse.self,
                    decoder: JSONDecoder())
            .map { $0.forecast.forecastday }
            .eraseToAnyPublisher()
    }
}
