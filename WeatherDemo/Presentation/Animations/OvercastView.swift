//
//  OvercastView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 14/5/25.
//
import SwiftUI

struct OvercastView: View {
    @State var isFullScreen: Bool = false
    @State private var xOffset1: CGFloat = -150
    @State private var xOffset2: CGFloat = -300
    @State private var xOffset3: CGFloat = -450

    var body: some View {
        HStack {
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(height: 100)
                .foregroundColor(.gray)
                .opacity(0.8)
                .offset(x: xOffset1, y: isFullScreen ? -200 : 0)
                .onAppear {
                    withAnimation(.linear(duration: Double.random(in: 5...10)).repeatForever(autoreverses: false)) {
                        xOffset1 = 400
                    }
                }
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(height: 100)
                .foregroundColor(.gray)
                .opacity(0.8)
                .offset(x: xOffset2, y: isFullScreen ? -200 : 0)
                .onAppear {
                    withAnimation(.linear(duration: Double.random(in: 6...11)).repeatForever(autoreverses: false)) {
                        xOffset2 = 400
                    }
                }
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(height: 100)
                .foregroundColor(.gray)
                .opacity(0.8)
                .offset(x: xOffset3, y: isFullScreen ? -200 : 0)
                .onAppear {
                    withAnimation(.linear(duration: Double.random(in: 7...12)).repeatForever(autoreverses: false)) {
                        xOffset3 = 400
                    }
                }
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
    OvercastView(isFullScreen: false)
}
