//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Robert Thomas on 6/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
            DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
            DayForecast(day: "Wed", isRainy: true, high: 60, low: 40)
            DayForecast(day: "Thur", isRainy: true, high: 65, low: 45)
            DayForecast(day: "Fri", isRainy: false, high: 80, low: 60)
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    var body: some View {
        VStack {
            Text(day)
                .font(Font.subheadline.bold())
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.subheadline)
                .padding(5)
            Text("High: \(high)")
                .fontWeight(Font.Weight.semibold)
            Text("Low: \(low)")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding()
    }
}
