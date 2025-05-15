//
//  DefaultView.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//
import SwiftUI

struct DefaultView: View {
    let title: String
    let content: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.secondary)
                Text(title)
                    .foregroundColor(.secondary)
            }
            
            Text(content)
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 10)
                
            
        }
        .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 40)
        .background(.ultraThinMaterial.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    DefaultView(title: "Humedad", content: "84%", icon: "humidity.fill")
        .preferredColorScheme(.dark)
}
