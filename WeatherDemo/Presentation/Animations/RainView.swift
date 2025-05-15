//
//  RainView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//
import SwiftUI

struct RainDrop: View {
    @State private var yOffset: CGFloat = -500

    var body: some View {
        Circle()
            .frame(width: 3, height: 15)
            .foregroundColor(.blue)
            .offset(y: yOffset)
            .onAppear {
                withAnimation(.linear(duration: Double.random(in: 5...10)).repeatForever(autoreverses: false)) {
                    yOffset = 400
                }
            }
    }
}

struct RainView: View {
    @State var isFullScreen: Bool = false
    
    var body: some View {
        ZStack {
            ForEach(0..<60) { i in
                RainDrop()
                    .position(x: CGFloat.random(in: 0...500), y: CGFloat.random(in: -200...0))
            }
            .frame(height: 100)
        }
        .frame(maxWidth: .infinity, maxHeight: getHeight())
        .padding()
        .background(Color(.rain))
        .clipShape(RoundedRectangle(cornerRadius: isFullScreen ? 0 : 30))
    }
    
    func getHeight() -> CGFloat {
        return isFullScreen ? .infinity : 100
    }
}

#Preview {
    RainView(isFullScreen: true)
}
