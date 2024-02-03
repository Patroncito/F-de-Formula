//
//  TeamStandingView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 01/02/24.
//

import SwiftUI

struct TeamStandingRowView: View {
     
    var teamConstructor : ConstructorStanding_currentConstructor
    
    
    var body: some View {
        
        
        Button(action: {
            print(teamConstructor.Constructor)
        }, label: {
           
                
            ZStack(alignment: .topLeading) {
               Color.color3
                HStack{

                        Spacer()
                    
                            VStack(alignment: .trailing){
                                
                                if (teamConstructor.position == "1" || teamConstructor.position == "2" || teamConstructor.position == "3")  {
                                    Image(teamConstructor.Constructor.constructorId)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(minWidth: 0 , maxWidth: 100, minHeight: 0, maxHeight: 60)
                                    .scaledToFit()
                                    .padding(.top, 10)
                                  
                                }
                               
                                Text(teamConstructor.Constructor.name )
                                    .minimumScaleFactor(0.6)
                                        .bold()
                                        .font(.title)
                                        .lineLimit(1)
                                        .fontWeight(.heavy)
                            
                        }
                        .foregroundStyle(.white)
                    
                        
                    Text(teamConstructor.position)
                            .font(.system(size: 40))
                            .bold()
                            .foregroundStyle(.white)
                            .frame(minWidth: 0, maxWidth: 70)
                            .frame(minHeight: 0, maxHeight: teamConstructor.position == "1" || teamConstructor.position == "2" || teamConstructor.position == "3" ? 160 : 100)
                            .background(Color(teamConstructor.Constructor.constructorId))

                    }
                
                Text(teamConstructor.points  + " pts")
                    .frame(minWidth: 0, maxWidth: 70, minHeight: 0, maxHeight: 20)
                    .foregroundStyle(.color4)
                    .font(.headline)
                    .bold()
                    .padding(5)
                    .background(Color.color5)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .padding([.top, .leading], 20)
    
                
            }
            .frame(minWidth: 0 , maxWidth: .infinity)
            .frame(height: teamConstructor.position == "1" || teamConstructor.position == "2" || teamConstructor.position == "3" ? 160 : 100)

            .clipShape(RoundedRectangle(cornerRadius: 20))

        })
        
        
    }
}

#Preview {
    
    TeamStandingRowView(teamConstructor: team)
}



let team = ConstructorStanding_currentConstructor(position: "2", positionText: "1", points: "344", wins: "12", Constructor: constructor2)

let constructor2 = Constructor_currentConstructor(constructorId: "red_bull", url: "", name: "Patron F1 Team", nationality: "Austrian")
