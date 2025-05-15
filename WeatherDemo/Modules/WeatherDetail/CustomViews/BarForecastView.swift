//
//  BarForecastView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//
import SwiftUI

struct BarForecastView: View {
    let globalMin: Double
    let globalMax: Double
    let min: String
    let max: String
    
    var body: some View {
        GeometryReader { geometry in
            let minDouble = Double(min) ?? 0.0
            let maxDouble = Double(max) ?? 0.0
           
            
                        let totalRange = globalMax - globalMin
                        let leftOffset = (minDouble - globalMin) / totalRange
                        let barWidth = (maxDouble - minDouble) / totalRange

                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 6)
                            
                            Rectangle()
                                .fill(.white)
                                .frame(
                                    width: geometry.size.width * barWidth,
                                    height: 6
                                )
                                .offset(x: geometry.size.width * leftOffset)
                                .animation(.easeInOut(duration: 0.3), value: "forecast")
                        }
                    }
                    .frame(height: 6)
                    .padding(.horizontal)
    }
}

#Preview {
    BarForecastView(globalMin: 10, globalMax: 20, min: "12", max: "18")
}
