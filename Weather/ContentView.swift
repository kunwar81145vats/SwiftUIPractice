//
//  ContentView.swift
//  Weather
//
//  Created by Kunwar Vats on 03/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient.linearGradient(colors: [.blue, Color("lightBlue")], startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
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
