//
//  ForecastResponse.swift
//  YereWeather
//
//  Created by Dianella on 19.05.25.
//

struct ForecastResponse: Codable {
    let forecast: Forecast
}

struct Forecast: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable {
    let date: String
    let day: Day
}

struct Day: Codable {
    let avgtemp_c: Double
    let maxwind_kph: Double
    let avghumidity: Double
    let condition: Condition
}

struct Condition: Codable {
    let text: String
    let icon: String
}
