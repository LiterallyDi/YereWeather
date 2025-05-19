//
//  ForecastCellView.swift
//  YereWeather
//
//  Created by Dianella on 19.05.25.
//

import SwiftUI

struct ForecastCellView: View {
    let day: ForecastDay

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https:\(day.day.condition.icon)")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 5) {
                Text(day.date)
                    .font(.headline.bold())
                Text(day.day.condition.text)
                    .font(.subheadline)
                    .italic()

                Text("Temperature: \(Int(day.day.avgtemp_c))°C")
                Text("Wind: \(Int(day.day.maxwind_kph)) kph")
                Text("Humidity: \(Int(day.day.avghumidity))%")
            }
        }
    }
}

#Preview {
    ForecastCellView(day: ForecastDay(
        date: "2025-05-20",
        day: Day(
            avgtemp_c: 21.0,
            maxwind_kph: 14.0,
            avghumidity: 60.0,
            condition: Condition(
                text: "Sunny",
                icon: ""
            )
        )
    ))
}
