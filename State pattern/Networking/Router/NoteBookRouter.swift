//
//  BookRouter.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import Foundation
import Alamofire

enum NoteBookRouter {
    
    case user
}

extension NoteBookRouter: RouterInterface {
    
    var method: HTTPMethod {
        switch self {
        case .user:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var url: URL {
        let relativePath: String
        switch self {
        case .user:
            relativePath = "users"
        }
        return NetworkingConstants.baseURL.appendingPathComponent(relativePath)
    }
    
}
