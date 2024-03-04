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
        
  
        NavigationLink (destination: ScheduleDetailsView(raceSchedule: raceSchedule)) {
            HStack{
                
                VStack(spacing: 4) {
                    Text(getScheduleDate(date: raceSchedule.date)?.joined(separator: "-") ?? "00-00")
                        .font(.title3)
                        .fontWeight(.heavy)
                    
                    Text(getMonthText(date:raceSchedule.date))
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Color.color1)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text(raceSchedule.Circuit.Location.country)
                        .bold()
                        .font(.largeTitle)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    
                    
                    Text(raceSchedule.Circuit.circuitName + " Grand Prix " + raceSchedule.season)
                        .multilineTextAlignment(.trailing)
                    
                }


            }
            .padding()
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
        }

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ScheduleRowView(raceSchedule: raceTemporalModel).fixedSize()
}

let raceTemporalModel = Race_races(season: "2023", round: "1", url: "urlasdad", raceName: "Saudi Arabian Grand Prix", Circuit: circuits, date: "2023-01-19", time: "7:00:00Z", FirstPractice: Practice, SecondPractice: Practice, ThirdPractice: Practice, Qualifying: Practice)

let circuits = Circuit_races(circuitId: "jeddah", url: "sfas", circuitName: "Jeddah Corniche Circuit", Location: location)

let location = Location_races(lat: "21.6319", long: "39.1044", locality: "Jeddah", country: "Saudi Arabia")

let Practice = Practice_races(date: "2023-03-17", time: "13:30:00Z")





// Race is 19
// weeknd has a duration for 3 days
// Race Number - 2
// Result Schedele = 19-2 -> 17 to 19
//TODO: WARNING WITH DATE LIKE ASUSTRALIAN  WHERE THE RACE IS IN 2 MARCH -> 2-2 = 0 AND 0 DOESNT EXISTS
// WE NEED USE THE FIRST PRACTICE DATE FOR THE FIRST DAY, AND DATE RACE. EXAMPLE
// 28 FEB --- 2 MARCH
// FP1 ------ RACE

func getScheduleDate(date: String) -> [String]? {
    let array = date.components(separatedBy: "-")
    var newData : [String] = []

    if let numericValue = Int(array[2]) {
           let resultado1 = numericValue - 2
           let resultado2 = numericValue

           newData.append(contentsOf: [String(resultado1), String(resultado2)])
           return newData
       } else {
           return nil  // Manejar el caso en que array[2] no sea un número válido
       }
}

func getMonthText(date : String) -> String {

    let fullDate = date.components(separatedBy: "-")
    let month : String = fullDate[1]
    
    
    switch month {
    case "01":return "JAN"
    case "02":return "FEB"
    case "03":return "MAR"
    case "04": return "APR"
    case "05":return "MAY"
    case "06": return "JUN"
    case "07": return "JUL"
    case "08": return "AGU"
    case "09": return "SEP"
    case "10": return "OCT"
    case "11": return "NOV"
    case "12" : return "DEC"
    default : return "DNF"
    }

}



