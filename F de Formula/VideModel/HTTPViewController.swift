//
//  HTTPViewController.swift
//  F de Formula
//
//  Created by Alfonso Patron on 31/01/24.
//

import Foundation
import SwiftUI


final class HTTPViewController : ObservableObject {
    
    @Published var currentStandingDrivers : CurrentStandingDriversMRData?
    @Published var currentStandingConstructor : CurrentStandingConstructorMRData?
    @Published var currentSchedule : MRData_races?
    @Published var imageDriver : [DriverImage]?

 
    
     func getAllDrivers () async throws -> AllDriverMRData {
        
        let endpoint = "https://ergast.com/api/f1/2023/drivers.json"
        
        guard let url = URL(string: endpoint) else { throw F1Error.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw F1Error.invalidResponse}
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(AllDriverMRData.self, from: data)
            
        } catch {
            throw F1Error.invalidData
        }
   
    }
    
    
    func getImageDriver(idDriver : String) async throws {
        
        let endpoint = "https://api.openf1.org/v1/drivers?driver_number=\(idDriver)&session_key=9158"
        
        print("endpoint : " + endpoint)
        print("Number Driver :" + idDriver)
        
        guard let url = URL(string: endpoint) else { throw F1Error.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw F1Error.invalidResponse}
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            try await MainActor.run {
                imageDriver =  try  decoder.decode([DriverImage].self, from: data)
            }
        } catch {
            throw F1Error.invalidData
        }

        
        
        
    }
    
    
     func getCurrentStandingDrivers () async throws  {
        
        let endpoint = "https://ergast.com/api/f1/current/driverStandings.json"
        
        guard let url = URL(string: endpoint) else {throw F1Error.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw F1Error.invalidResponse}
        
        do {
            
            let decoder = JSONDecoder()
            
            try  await MainActor.run {
                currentStandingDrivers = try  decoder.decode(CurrentStandingDriversMRData.self, from: data)

            }
            
            
            
        } catch {
            throw F1Error.invalidData
        }
        
    }
    
    
     func getCurrentConstructor () async throws {
        
        
        let endpoint = "https://ergast.com/api/f1/current/constructorStandings.json"
        
        guard let url = URL(string: String(endpoint)) else {throw F1Error.invalidURL}
        
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw F1Error.invalidResponse}
        
        do{
            let decoder = JSONDecoder()
            
            
            try await MainActor.run{
                currentStandingConstructor = try decoder.decode(CurrentStandingConstructorMRData.self, from: data)
            }
            
        } catch{
            throw F1Error.invalidData
        }
        
        
    }
    
    
    func getCurrentSchedule() async throws {
        
        let endpoint = "https://ergast.com/api/f1/current.json"
        
        guard let url = URL(string: endpoint) else { throw F1Error.invalidURL}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {throw F1Error.invalidResponse}
        
        
        do {
            
            let decoder = JSONDecoder()
            try await MainActor.run {
                 currentSchedule = try decoder.decode(MRData_races.self, from: data)
            }
            
        } catch {
            throw F1Error.invalidData
        }
        
        
    }
    
    
    enum F1Error : Error {
        case invalidURL
        case invalidResponse
        case invalidData
    }
    
    
    
    
    
    func changeSizeImageURL(in urlString: String, with newTransformValue: String) -> String {
        let updatedURL = urlString.replacingOccurrences(of: "1col", with: newTransformValue)
        return updatedURL
    }


}



