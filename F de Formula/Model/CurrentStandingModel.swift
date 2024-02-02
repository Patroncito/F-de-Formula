//
//  CurrentStandingModel.swift
//  F de Formula
//
//  Created by Alfonso Patron on 31/01/24.
//

import Foundation

struct CurrentStandingDriversMRData : Codable {
    let MRData : header
}

struct header: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let StandingsTable: StandingsTable

   
}


struct StandingsTable: Codable {
    let season: String
    let StandingsLists: [StandingsList]

  
}


struct StandingsList: Codable {
    let season, round: String
    let DriverStandings: [DriverStanding]

   
}

struct DriverStanding: Codable {
    let position, positionText, points, wins: String
    let Driver: Driver_currentStanding
    let Constructors: [Constructor]

}



struct Driver_currentStanding: Codable {
    let driverId, permanentNumber, code, url: String
    let givenName, familyName, dateOfBirth, nationality: String

}


struct Constructor: Codable {
    let constructorId, url, name, nationality: String

}

