//
//  CodableProtocol.swift
//  CarRentalApp
//
//  Created by admin on 24.05.2022.
//

import Foundation

struct Joke: Codable {
    
    let error: Bool
    let category, type, setup, delivery: String
    let flags: Flags
    let id: Int
    let safe: Bool
    let lang: String
    
}


struct Flags: Codable {
    
    let nsfw, religious, political, racist: Bool
    let sexist, explicit: Bool
    
}
