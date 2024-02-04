//
//  PilotsListView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 31/01/24.
//

import SwiftUI

struct PilotsListView: View {
    
    @StateObject private var viewController = HTTPViewController()
    
    var body: some View {
        let standingsLists = viewController.currentStandingDrivers?.MRData.StandingsTable.StandingsLists

      
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false){
                        
                        HStack{
                            
                        }
                        if let standingsLists = standingsLists {
                            ForEach(standingsLists.indices, id: \.self) { index in
                                let array = standingsLists[index]
                                ForEach(array.DriverStandings, id: \.position) { item in
                                  
                                    RowCellPilotLeader(driver2: item)
                                }
                            }
                            
                        } else {
                            ProgressView()
                            Text("Loading Drivers...")
                        }
                    }
                    .padding(.horizontal)
                
                .onAppear{
                    Task {
                        try await viewController.getCurrentStandingDrivers()
                    }
            }
                .navigationTitle("Drivers")
                    .foregroundStyle(.white)
                    .toolbarColorScheme(.dark)
                    .navigationBarTitleDisplayMode(.automatic)
                    .toolbarBackground(Color.color1)
                    .toolbar{
                        Button(action: {
                            print("Button 1")
                        }, label: {
                            Image(systemName: "steeringwheel")
                                .foregroundColor(.white)
                                .scaledToFit()
                            
                        })
                    }
            }
        
        
    }
    
}



#Preview {
    PilotsListView()
}
