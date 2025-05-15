//
//  WindView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//
import SwiftUI

struct WindView: View {
    let directionText: String
    let directionDegrees: String
    let speed: String

    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "wind")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.secondary)
                Text("wind")
                    .foregroundColor(.secondary)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("wind")
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(speed) km/h")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("direction")
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(directionDegrees)º \(directionText)")
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.trailing, 20)
                
                Spacer()
                ZStack {
                    Circle()
                        .stroke(.white.opacity(0.2), lineWidth: 2)
                        .frame(width: 100, height: 100)

                    ForEach(CardinalPoint.allCases, id: \.self) { point in
                        Text(point.localizedName)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .position(point.position(in: 100))
                    }

                    Image(systemName: "arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .rotationEffect(.degrees(Double(directionDegrees) ?? 0.0))
                        .foregroundColor(.white)
                }
                .frame(width: 100, height: 100)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    WindView(directionText: "S", directionDegrees: "196", speed: "9")
        .preferredColorScheme(.dark)
}
