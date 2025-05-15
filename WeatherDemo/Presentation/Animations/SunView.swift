//
//  SunView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 13/5/25.
//
import SwiftUI

struct SunView: View {
    @State private var rotate = false
    @State var isFullScreen: Bool = false

    var body: some View {
        Group {
            VStack {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: getSunSize().width, height: getSunSize().height)
                    .foregroundColor(.yellow)
                    
                    .rotationEffect(.degrees(rotate ? 360 : 0))
                    .animation(.linear(duration: 10).repeatForever(autoreverses: false), value: rotate)
                    .onAppear { rotate = true }
                    .padding(.top, isFullScreen ? 80  : 0)
                if isFullScreen { Spacer() }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: getHeight())
        .padding()
        .background(.cyan)
        .clipShape(RoundedRectangle(cornerRadius: isFullScreen ? 0 : 30))
    }
    
    func getHeight() -> CGFloat {
        return isFullScreen ? .infinity : 100
    }
    
    func getSunSize() -> CGSize {
        let size = isFullScreen ? 150 : 100
        return CGSize(width: size, height: size)
    }
}

#Preview {
    SunView(isFullScreen: true)
}
