//
//  RowCellPilot.swift
//  F de Formula
//
//  Created by Alfonso Patron on 31/01/24.
//

import SwiftUI

struct RowCellPilotLeader: View {
    
    //var driver : MRData_CurrentStanding
    var driver2 : DriverStanding
    
    var imageUrl = URL(string: "https://www.formula1.com/content/dam/fom-website/drivers/M/MAXVER01_Max_Verstappen/maxver01.png.transform/2col/image.png")
    
    var body: some View {
        
        
        Button(action: {
            print(driver2.Driver)
        }, label: {
            ZStack() {
                Color(.color3)
                
                HStack{
                    //IMAGE PILOT
                    ZStack(alignment: .bottomLeading) {
                        
                        
                        if driver2.position == "1" {
                            AsyncImage(url: imageUrl) { image in
                                image
                                    .resizable()
                                    .frame(width: 140, height: 140)
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Circle()
                                    .frame(width: 80)
                                    .foregroundStyle(.yellow)
                            }
                        }
                        
                         
                        Text(driver2.points  + " pts")
                            .frame(minWidth: 0, maxWidth: 70, minHeight: 0, maxHeight: 20)
                            .foregroundStyle(.color4)
                            .font(.headline)
                            .bold()
                            .padding(5)
                            .background(Color.color5)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                            .padding(.bottom,  10)
                            .padding(.leading, 10)
                        
                    }

                    Spacer()
                    VStack(alignment: .trailing) {
                       

                        if driver2.position == "1" {       // CARD DRIVER

                            
                            //FIRST NAME

                            Text(driver2.Driver.givenName)
                                    .font(.footnote)
                                    .fontWeight(.medium)
                            //LAST NAME

                            Text(driver2.Driver.familyName)
                                    .bold()
                                    .minimumScaleFactor(0.5)
                                    .font(.title)
                                    .lineLimit(1)
                                    .fontWeight(.heavy)
                            
                        } else {
                            
                            // ROW DRIVER
                            Text(driver2.Driver.givenName  + " " + driver2.Driver.familyName)
                                .bold()
                                .bold()
                                .minimumScaleFactor(0.7)
                                .font(.title)
                                .lineLimit(1)
                                .fontWeight(.heavy)
                                .font(.title)
                                .lineLimit(1)
                                .fontWeight(.heavy)
                            
                        }
                           
                        
                    
                        HStack{
                            Text(driver2.Constructors[0].name)
                                .font(.footnote)

                            Image("\(driver2.Constructors[0].constructorId)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        
                        
                        
                        
                        
                    }
                    .padding(.vertical)
                    .padding(.trailing, 10)
                    .foregroundStyle(.white)
                
                    Text(driver2.position)
                        .font(.system(size: 40))
                        .bold()
                        .foregroundStyle(.white)
                        .frame(minWidth: 0, maxWidth: 70)
                        .frame(minHeight: 0, maxHeight: driver2.position == "1" ? 140 : 90)
                        .background(Color(driver2.Constructors[0].constructorId))

                }
                
            }
            .frame(minWidth: 0 , maxWidth: .infinity, minHeight: 0, maxHeight: driver2.position == "1" ? 140 : 90)
            .clipShape(RoundedRectangle(cornerRadius: 20))

        })
        
        
    }
}

#Preview {
    
    RowCellPilotLeader(driver2: driverstanding )
}


let thissss = header(xmlns: "", series: "f1", url: "", limit: "", offset: "", total: "", StandingsTable: standingTable)

let standingTable = StandingsTable(season: "2023", StandingsLists: [standingList])

let standingList = StandingsList(season: "2023", round: "22", DriverStandings: [driverstanding])

let driverstanding = DriverStanding(position: "1", positionText: "1", points: "234", wins: "22", Driver: driver, Constructors: [constructor])


let driver = Driver_currentStanding(driverId: "verst", permanentNumber: "1", code: "VER", url: "", givenName: "Max", familyName: "Verstappen", dateOfBirth: "1990-01-26", nationality: "Dutch")

let constructor = Constructor(constructorId: "mercedes", url: "", name: "Red Bull Racing", nationality: "Austrian")
