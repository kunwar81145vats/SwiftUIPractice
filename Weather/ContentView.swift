//
//  ContentView.swift
//  Weather
//
//  Created by Kunwar Vats on 03/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgrounView(isNight: $isNight)
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76°")
                        .font(.system(size: 70, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "cloud.hail.fill",
                                   temp: 76)
                    WeatherDayView(dayOfWeek: "Wed", 
                                   imageName: "cloud.bolt.rain.fill",
                                   temp: 66)
                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "cloud.bolt.fill",
                                   temp: 56)
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "sun.max.fill",
                                   temp: 76)
                    WeatherDayView(dayOfWeek: "Sat", 
                                   imageName: "cloud.sleet.fill",
                                   temp: 86)
                }
                
                Spacer()
                
                Button {
                    print("button clicked")
                    isNight.toggle()
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temp)°")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgrounView: View {
    
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient.linearGradient(colors: [isNight ? .black : .blue,
                                               isNight ? .gray : Color("lightBlue")], startPoint: .topLeading,
                                      endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}
