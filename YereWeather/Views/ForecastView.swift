//
//  ForecastView.swift
//  YereWeather
//
//  Created by Dianella on 19.05.25.
//

import SwiftUI

struct ForecastView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.forecast, id: \.date) { day in
                ForecastCellView(day: day)
            }
            .navigationTitle("Weather for Yerevan")
            .onAppear {
                viewModel.loadWeather(for: "yerevan")
            }
        }
    }
}
