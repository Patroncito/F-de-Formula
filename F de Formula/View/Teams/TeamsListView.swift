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
        
        NavigationStack{
            
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
                    
                    let appearance = UINavigationBarAppearance()
                               appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                               UINavigationBar.appearance().standardAppearance = appearance
                               UINavigationBar.appearance().scrollEdgeAppearance = appearance
                    
                }
                .navigationTitle("Teams")
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
    TeamsListView()
}

