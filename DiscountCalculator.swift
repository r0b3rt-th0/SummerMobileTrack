//
//  ContentView.swift
//  discount Calculator
//
//  Created by Robert Thomas on 6/30/25.
//
import SwiftUI

struct ContentView: View {
    @State private var productPrice: Double = 0.0
    @State private var discountAmount: Double = 0.0
    @State private var finalPrice: Double = 0.0
    @State private var hasCalculated: Bool = false

    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Discount Calculator")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            TextField("Enter product price", value: $productPrice, formatter: numberFormatter)
                .padding()
                .foregroundStyle(.white)
                .background(Color.red.opacity(0.2))
                .cornerRadius(50)
            TextField("Enter discount amount (%)", value: $discountAmount, formatter: numberFormatter)
                .padding()
                .foregroundStyle(.white)
                .background(Color.red.opacity(0.2))
                .cornerRadius(50)
            Button(action: calculateFinalPrice) {
                Text("Calculate Final Price")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    .padding(.horizontal)
            }

            if hasCalculated {
                Text("Final Price: $\(finalPrice, specifier: "%.2f")")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.white)
            }

            Spacer()
        }
        .background(Color.black.ignoresSafeArea())
    }

    func calculateFinalPrice() {
        let discountValue = productPrice * (discountAmount / 100)
        finalPrice = max(productPrice - discountValue, 0)
        hasCalculated = true
    }
}

#Preview {
    ContentView()
}

