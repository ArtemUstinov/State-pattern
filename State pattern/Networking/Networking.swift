//
//  Networking.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import Alamofire

final class Networking {
    
    @discardableResult
    static func request<T: Decodable>(_ urlRequest: URLRequestConvertible,
                                      failureCodes: [Int] = [],
                                      result: @escaping (Result<T, Networking.Error>) -> Void) -> Request {
        return AF.request(urlRequest).responseData { (response) in
            guard let code = response.response?.statusCode,
                  let data = response.data else {
                result(.failure(.connection))
                return
            }
            
            let url = urlRequest.urlRequest?.url?.absoluteString ?? ""
            let decoder = JSONDecoder()
            
            switch code {
            case 200..<300:
                do {
                    let object = try decoder.decode(T.self, from: data)
                    result(.success(object))
                    return
                } catch {
                    result(.failure(.decoding(description: error.localizedDescription)))
                    LogService.log("Url: \(url). Code: \(code). Error: \(error). Loc: \(error.localizedDescription)", log: .default, type: .error)
                }
                
            case 400:
                result(.failure(.incorrectDataInRequestParameters))
                LogService.log("Url: \(url). Code: \(code). Error str: \(String(bytes: data, encoding: .utf8) ?? "")", log: .default, type: .error)
                
            case 403:
                result(.failure(.decoding(description: "Error 403")))
                LogService.log("Url: \(url). Code: \(code). Error str: \(String(bytes: data, encoding: .utf8) ?? "")", log: .default, type: .error)
                
            case 500..<600:
                result(.failure(.internalServerError))
                LogService.log("Url: \(url). Code: \(code). Error str: \(String(bytes: data, encoding: .utf8) ?? "")", log: .default, type: .error)
                
            default:
                result(.failure(.decoding(description: "Unknown error")))
                LogService.log("Url: \(url). Code: \(code). Error str: \(String(bytes: data, encoding: .utf8) ?? "")", log: .default, type: .error)
            }
        }
    }
}
