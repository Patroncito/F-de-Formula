//
//  CurrentStandingConstructorModel.swift
//  F de Formula
//
//  Created by Alfonso Patron on 01/02/24.
//

import Foundation


struct CurrentStandingConstructorMRData: Codable {
    let MRData: MRData_currentConstructor
}

struct MRData_currentConstructor: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total : String
    let StandingsTable: StandingsTable_currentConstructor
}

struct StandingsTable_currentConstructor: Codable {
    let season: String
    let StandingsLists: [StandingsList_currentConstructor]
}

struct StandingsList_currentConstructor: Codable {
    let season, round: String
    let ConstructorStandings: [ConstructorStanding_currentConstructor]
}

struct ConstructorStanding_currentConstructor: Codable {
    let position, positionText, points, wins: String
    let Constructor: Constructor_currentConstructor
}

struct Constructor_currentConstructor: Codable {
    let constructorId, url, name, nationality: String
}
