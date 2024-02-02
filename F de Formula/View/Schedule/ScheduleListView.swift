//
//  RacesListView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 01/02/24.
//

import SwiftUI

struct ScheduleListView: View {
    
    @StateObject var viewModel = HTTPViewController()
    
    var body: some View {
        let scheduleItem = viewModel.currentSchedule?.MRData.RaceTable.Races

        
        ScrollView(.vertical, showsIndicators: false) {
            if let scheduleItem = scheduleItem {

                ForEach(scheduleItem.indices , id: \.self){ item in
                    ScheduleRowView(raceSchedule: scheduleItem[item])
                    
                }
                
            } else {
                Text("Loading Schedule")
            }
        }
        .padding(.horizontal, 10)
        .onAppear{
            Task{
                do{
                    try await viewModel.getCurrentSchedule()
                } catch let error {
                    print("an error ocurrend : \(error)")
                    
                }
            }
        }
    }

}


#Preview {
    ScheduleListView()
}