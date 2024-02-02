//
//  ContentView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 30/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        
        TabView{
            
            TeamsListView()
                .tabItem {
                    Label("Teams", systemImage: "wrench.and.screwdriver")
                }
            PilotsListView()
                .tabItem {
                    Label("Drivers", systemImage: "person.3")
                }
            
            ScheduleListView()
                .tabItem {
                    Label("Schedule", systemImage: "calendar")

                }
            
        }
    }
}

#Preview {
    ContentView()
}
