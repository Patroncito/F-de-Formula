//
//  TeamsListView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 01/02/24.
//

import SwiftUI

struct TeamsListView: View {
    
    @StateObject private var viewModel = HTTPViewController()

    
    var body: some View {
        
        let standingsLists = viewModel.currentStandingConstructor?.MRData.StandingsTable.StandingsLists
        
       
        
        ScrollView(.vertical, showsIndicators: false){
            
            if let standingsLists = standingsLists {
                
                ForEach(standingsLists.indices, id: \.self) { index in
                    ForEach(standingsLists[index].ConstructorStandings, id: \.position) { constructor in
                      
                        TeamStandingRowView(teamConstructor: constructor)
                        
                    }
                }
                    
            } else {
                Text("Loading Data...")
            }
   
            
            
        }
        .padding(.horizontal, 10)
        .onAppear{
            Task {
                do {
                    try await viewModel.getCurrentConstructor()
                } catch let error {
                    print("Error with name: \(error)")
                }
            }
        }
    }
}

#Preview {
    TeamsListView()
}

