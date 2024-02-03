//
//  ScheduleRowView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 01/02/24.
//

import SwiftUI

struct ScheduleRowView: View {
    let raceSchedule : Race_races

    var body: some View {
        
        
        Button(action: {
            
        
            
        }, label: {
            
            
            
            
            HStack{
                
                Text(separateDateinFormat(date: raceSchedule.date)?.joined(separator: "-") ?? "Error al separar la fecha")

                Spacer()

                VStack(alignment: .trailing) {
                    Text(raceSchedule.Circuit.Location.country)
                        .bold()
                        .font(.largeTitle)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    
                    
                    Text(raceSchedule.Circuit.circuitName + "Grand Prix " + raceSchedule.season)
                        .multilineTextAlignment(.trailing)
                    
                }
                .padding(.trailing)


            }
            .foregroundStyle(.white)
            .frame(height: 120)
            .background(
                ZStack{
                    
                    Image(raceSchedule.Circuit.circuitId)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120, alignment: .bottom)
                  
                    Color.color3.opacity(0.65)
                    
                }
                

            )
            .clipShape(RoundedRectangle(cornerRadius: 16))

        })
    }
}

#Preview {
    ScheduleRowView(raceSchedule: race)
        .padding(.horizontal, 10)
}

let race = Race_races(season: "2023", round: "1", url: "urlasdad", raceName: "Saudi Arabian Grand Prix", Circuit: circuits, date: "2023-03-19", time: "7:00:00Z", FirstPractice: Practice, SecondPractice: Practice, ThirdPractice: Practice, Qualifying: Practice)

let circuits = Circuit_races(circuitId: "jeddah", url: "sfas", circuitName: "Jeddah Corniche Circuit", Location: location)

let location = Location_races(lat: "21.6319", long: "39.1044", locality: "Jeddah", country: "Saudi Arabia")

let Practice = Practice_races(date: "2023-03-17", time: "13:30:00Z")







func separateDateinFormat(date: String) -> [String]? {
    let array = date.components(separatedBy: "-")
    var newData : [String] = []
    newData.append(contentsOf: [array[1], array[2]])
    return newData
}
