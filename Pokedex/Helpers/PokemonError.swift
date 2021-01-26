//
//  PokemonError.swift
//  Pokedex
//
//  Created by Benjamin Tincher on 1/26/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

enum PokemonError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String {
        switch self {
        
        case .invalidURL:
            return "Unable to reach the server"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "Server returned no data."
        case .unableToDecode:
            return "Unable to decode image file."
        }
    }
}
