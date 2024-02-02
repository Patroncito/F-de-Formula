//
//  WelcomeView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 31/01/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var navigationActive: Bool = false

    var body: some View {
        
        NavigationView{
            ZStack(){
                
                Image("team5")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)


                LinearGradient(colors: [Color.black, Color.black.opacity(0.7), Color.black.opacity(0.2)], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                

                VStack() {
                    
                    
                    Text("Aprende de Formula 1 mientras te diviertes.")
                        .foregroundColor(Color(.color5))
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth:0 , maxWidth: 400, minHeight: 0)
                        .padding(.vertical, 20)

                    Spacer()

                    Button(action: {
                        // Acción que se ejecutará cuando se presione el botón
                        navigationActive = true

                    }) {
                        Text("Encender Motor")
                            .frame(minWidth: 0, maxWidth: 350, minHeight: 0, maxHeight: 70)
                            .background(Color(.color1)) // Puedes cambiar el color de fondo
                            .foregroundColor(.white) // Color del texto
                            .font(.title3) // Puedes ajustar la fuente como desees
                            .bold()
                            .clipShape(RoundedRectangle(cornerRadius: 12.0))
                        

                    }
                    


                }
                
                

            }
        }

        
    }
}

#Preview {
    WelcomeView()
}


