//
//  CurrentSchedulesModel.swift
//  F de Formula
//
//  Created by Alfonso Patron on 01/02/24.
//

import Foundation

struct MRData_races: Codable {
    let MRData: Header_races
}

struct Header_races: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let RaceTable: RaceTable_races
}

struct RaceTable_races: Codable {
    let season: String
    let Races: [Race_races]
}

struct Race_races: Codable {
    let season: String
    let round: String
    let url: String
    let raceName: String
    let Circuit: Circuit_races
    let date: String
    let time: String
    let FirstPractice : Practice_races
    let SecondPractice : Practice_races
    let ThirdPractice : Practice_races?
    let Qualifying : Practice_races?
}

struct Circuit_races: Codable {
    let circuitId: String
    let url: String
    let circuitName: String
    let Location: Location_races
}

struct Location_races: Codable {
    let lat: String
    let long: String
    let locality: String
    let country: String
}

struct Practice_races: Codable {
    let date: String
    let time: String
}




