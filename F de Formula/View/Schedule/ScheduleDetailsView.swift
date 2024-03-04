//
//  ScheduleDetailsView.swift
//  F de Formula
//
//  Created by Alfonso Patron on 07/02/24.
//

import SwiftUI
import MapKit


struct ScheduleDetailsView: View {
    let raceSchedule : Race_races
    
    @State var camera : MapCameraPosition = .automatic

    
    var body: some View {
        
        
        let gpLocationMarker = CLLocationCoordinate2D(
            latitude: Double(raceSchedule.Circuit.Location.lat) ?? 0.0,
            longitude: Double(raceSchedule.Circuit.Location.long) ?? 0.0)
        
        NavigationStack {
            
            Map(position: $camera) {
                Marker("\(raceSchedule.Circuit.circuitName)", coordinate: gpLocationMarker)
            }
            
            
        }.mapStyle(.imagery)
    }
    
    
    
}

#Preview {
    ScheduleDetailsView(raceSchedule: raceTemporalModel)
}
