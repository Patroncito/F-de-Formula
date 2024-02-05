//
//  DriverDetailsView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 04/02/24.
//

import SwiftUI

struct DriverDetailsView: View {
    var body: some View {
        
        NavigationStack {
            ScrollView (.vertical, showsIndicators: false) {
                
                //MARK: DRIVER PROFILE IMAGE
                ZStack (alignment: .topTrailing) {
                    
                    LinearGradient(colors: [Color.mercedes.opacity(0.7), Color.mercedes], startPoint: .bottom, endPoint: .top)
                    
                    Image("mercedes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(.trailing, 20)
                        .padding(.top, 20)
                    
                    ZStack (alignment: .bottom) {
                        
                        Image("driverPlaceholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 380)
                            .foregroundStyle(.black)
                        
                        
                        HStack {
                            
                            Image("uk")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                            
                            Text("Lewis Hamilton")
                                .font(.largeTitle)
                                .bold()
                        }
                        .padding(.bottom, 20)
                        
                        
                    }
                    
                }
                .frame(height: 450)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal, 10)
                
                
                
                
                //MARK: COUNTRY AND POINTS
                
                HStack {
                    
                    VStack(alignment: .leading){
                        Text("Country")
                            .font(.subheadline)
                        Text("United Kindowm")
                            .font(.headline)
                            .bold()
                    }
                    Spacer()
                    
                    Text("840 pts")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(Color.color1)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                    
                    
                }.padding([.vertical, .horizontal], 20)
                
                
                //MARK: POSITION IN ACTUAL SEASON AND Wold TITTLES
                HStack(spacing: 10){
                    Text("5º")
                        .font(.system(size: 45))
                        .bold()
                    
                    Text("Current \nSeason")
                        .fontWeight(.light)
                        .font(.footnote)
                    Spacer()
                    
                    Text("World\nTitles")
                        .fontWeight(.light)
                        .font(.footnote)
                    
                    Text("8")
                        .font(.system(size: 45))
                        .bold()
                    
                    
                    
                }
                .padding(.vertical, 20)
                .padding(.horizontal)
                .background(Color.color3)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                
                
                //MARK: CAR
                ZStack(alignment: .topTrailing){
                    
                    Color.mercedes
                    
                    VStack(alignment: .trailing, spacing: 40){
                        
                        
                        HStack(alignment: .center) {
                            Image("mercedes")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                            Text("Mercedes AMG Petronas F1 Team")
                                .foregroundStyle(.black)
                                .bold()
                        }
                        .padding(.top, 20)
                        
                        
                        Image("car44")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 5)
                            .scaleEffect(x: -1, y: 1)
                            .padding(.bottom, 10)
                        
                    }
                    .padding(.trailing, 20)
                    
                    
                    
                }
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                
                
                
                //MARK: BORN DATE
                
                ZStack(alignment: .leading){
                    
                    Color(.color3)
                    
                    VStack(alignment: .leading, spacing: 20){
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Nationality")
                                .fontWeight(.light)
                                .font(.footnote)
                                
                            Text("British")
                                .font(.title)
                                .bold()
                        }
                        
                        VStack (alignment: .leading, spacing: 2){
                            Text("Date of birth")
                                .fontWeight(.light)
                                .font(.footnote)
                            Text("1985-01-07") // Change to DD/MM/YYYY
                                .font(.title)
                                .bold()
                        }
                        

                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 40)
                }
                .background(Color(.color3))
                .frame(height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                
                //MARK: BIO
                
           
                    GroupBox {
                        DisclosureGroup("Biography") {
                            Divider().padding(.vertical, 10)
                         
                            Text(bioTest)
                                .foregroundStyle(Color.white)
                                .font(Font.system(.body).bold())
                                .multilineTextAlignment(.leading)
                        }
                        .foregroundStyle(.white)
                        .bold()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            
                
            }.navigationTitle("Lewis Hamilton")
                .navigationBarTitleDisplayMode(.inline)
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
    DriverDetailsView()
}




let bioTest = "Sergio Michel \"Checo\" Pérez Mendoza (Spanish: [ˈseɾxjo ˈpeɾes] ; born 26 January 1990) is a Mexican racing driver who races in Formula One for Red Bull Racing, having previously driven for Sauber, McLaren, Force India, and Racing Point. He has won 6 Grand Prix races and scored 35 podium finishes.\nHe won his first Grand Prix driving for Racing Point at the 2020 Sakhir Grand Prix, breaking the record for the number of starts before a race win at 190. He earned his first Formula One pole position at the 2022 Saudi Arabian Grand Prix, breaking the record for the most races before a first pole position at 215. \nUp until 2012, Pérez was a member of the Ferrari Driver Academy. He made his Formula One debut driving for Sauber during the 2011 season. He took his first Formula One podium at the 2012 Malaysian Grand Prix with Sauber. Due to his young age and performance, he was referred to as \"The Mexican Wunderkind\". Pérez joined McLaren for the 2013 season, but the team did not score a single podium finish. Subsequently, the team decided to replace Pérez with Kevin Magnussen for the 2014 season.Force India signed Pérez for the 2014 season with a €15 million contract. He remained with Force India when the team went into administration in 2018 and reformed as the Racing Point team for 2019. In 2019, Racing Point signed a three-year extension with Pérez. In September 2020, Racing Point announced that Pérez would be leaving the team at the end of the season as Sebastian Vettel, a four-time F1 world champion, had been signed to replace him. In December, Pérez signed with Red Bull Racing for the 2021 season.\nHe is currently under contract with Red Bull Racing until the end of the 2024 season. He is also the owner of the powerboat racing team SP11 Team Mexico."
