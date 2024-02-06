//
//  PilotDrivers.swift
//  F de Formula
//
//  Created by Alfonso Patron on 31/01/24.
//

import Foundation


struct AllDriverMRData: Codable {
    let MRData: MRData
}

struct MRData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let driverTable: DriverTable


}

struct DriverTable: Codable {
    let season: String
    let drivers: [Driver]

}

struct Driver: Codable {
    let driverId, permanentNumber, code, url: String
    let givenName, familyName, dateOfBirth, nationality: String
    
}

  



struct DriverImage: Codable {
 
    let headshotUrl: String?
   
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        headshotUrl = try container.decodeIfPresent(String.self, forKey: .headshotUrl)
     
    }

}


struct DriverExtraData : Codable {
    
    let season : String
    let driver : [DataDriver]

}

struct DataDriver : Codable {
    let id : String
    let placeofborn : String
    let worldchampions : String
    let country : String
}
