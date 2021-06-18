//
//  Networking + Error.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import Foundation

extension Networking {
    
    enum Error: Swift.Error {
        case connection
        case decoding(description: String)
        case imageData
        case incorrectDataInRequestParameters
        case internalServerError
    }
}

extension Networking.Error: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .connection:
            return "No internet connection. Try it again."
            
        case let .decoding(description):
            return "Data parsing failure" + "\n" + description
            
        case .imageData:
            return "Image data failure"
            
        case .incorrectDataInRequestParameters:
            return "Data in request parameters is incorrect"
            
        case .internalServerError:
            return "Internal server error"
        }
    }
    
}
