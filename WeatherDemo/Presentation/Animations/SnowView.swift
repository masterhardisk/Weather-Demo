//
//  SnowView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//
import SwiftUI

struct Snowflake: View {
    @State private var yOffset: CGFloat = -100
    
    var body: some View {
        Image(systemName: "snow")
            .foregroundColor(.white)
            .font(.caption)
            .offset(y: yOffset)
            .onAppear {
                withAnimation(.linear(duration: Double.random(in: 5...10)).repeatForever(autoreverses: false)) {
                    yOffset = 400
                }
            }
    }
}

struct SnowView: View {
    @State var isFullScreen: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                ForEach(0..<50) { _ in
                    Snowflake()
                        .position(x: CGFloat.random(in: 0...500), y: CGFloat.random(in: 0...500))
                }
            }
            .frame(height: getHeight())
        }
        .frame(maxWidth: .infinity, maxHeight: getHeight())
        .padding()
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: isFullScreen ? 0 : 30))
        
    }
    
    func getHeight() -> CGFloat {
        return isFullScreen ? .infinity : 100
    }
}

#Preview {
    SnowView(isFullScreen: true)
}
