import SwiftUI

struct WeatherCardView: View {
    let weather: CurrentWeather
    
    var body: some View {
        ZStack {
            WeatherBackground(description: weather.originalDescription)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(weather.city)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(weather.hour)
                        .font(.footnote)
                        .foregroundColor(.white)
                    
                    Spacer()
                    Text(weather.description)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text(weather.temp)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    Text(weather.minMaxTemp)
                        .font(.caption)
                        .foregroundColor(.white)
                }
                .frame(alignment: .trailing)
            }
            .padding(20)
        }
        .frame(height: 100)
        .padding(.vertical, 20)
    }
}

#Preview {
    WeatherCardView(weather: .test)
}
