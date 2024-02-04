//
//  ContentView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 30/01/24.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor.color3
    }
    var body: some View {
        
        
            
      
      
            TabView {
                
                TeamsListView()
                    .tabItem {
                        Image("circuit")
                        Text("Teams")
                            
                    }
                PilotsListView()
                    .tabItem {
                        Image("helmet")
                            .resizable()
                            .frame(width: 30, height:30)
                        Text("Drivers")
                        
                        
                    }
                
                ScheduleListView()
                    .tabItem {
                        
                        Label("Schedule", systemImage: "calendar")

                    }
                
            }
            .tint(.color1)
        
        


        
      
    }
}

#Preview {
    ContentView()
}

//.navigationTitle("Drivers")
//    .foregroundStyle(.white)
//    .toolbarColorScheme(.dark)
//    .navigationBarTitleDisplayMode(.inline)
//    .toolbarBackground(Color.color1)
//    .toolbar{
//        Button(action: {
//            print("Button 1")
//        }, label: {
//            Image(systemName: "steeringwheel")
//                .foregroundColor(.white)
//                .scaledToFit()
//            
//        })
//    }
