//
//  CloudView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//
import SwiftUI

struct CloudView: View {
    @State private var xOffset: CGFloat = -150
    @State var isFullScreen: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "cloud.fill")
                .resizable()
                .frame(width: 150, height: 100)
                .foregroundColor(.gray)
                .opacity(0.8)
                .offset(x: xOffset, y: isFullScreen ? -200 : 0)
                .onAppear {
                    withAnimation(.linear(duration: Double.random(in: 5...10)).repeatForever(autoreverses: false)) {
                        xOffset = 400
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: getHeight())
        .padding()
        .background(Color(red: 0.55, green: 0.70, blue: 0.85)
)
        .clipShape(RoundedRectangle(cornerRadius: isFullScreen ? 0 : 30))
    }
    
    func getHeight() -> CGFloat {
        return isFullScreen ? .infinity : 100
    }
}

#Preview {
    CloudView(isFullScreen: true)
}
