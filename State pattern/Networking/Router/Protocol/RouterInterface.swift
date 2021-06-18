//
//  RouterInterface.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import Foundation
import Alamofire

protocol RouterInterface: URLRequestConvertible {
    
    var method: HTTPMethod { get }
    
    var parameters: [String: Any]? { get }
    
    var url: URL { get }
            
}

extension RouterInterface {
    
    func asURLRequest() throws -> URLRequest {
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
    
}
