//
//  LogService.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import os.log

final class LogService {
    
    static func log(_ message: String, log: OSLog = .default, type: OSLogType = .debug) {
        var identifierString: String = ""
        
        switch type {
        case .debug: identifierString += "#(Debug)"
        case .default: identifierString += "#(Default)"
        case .error: identifierString += "#(Error)"
        case .info: identifierString += "#(Info)"
        case .fault: identifierString += "#(Fault)"
        default: break
        }
        
        identifierString += " (Log) \(message)"
        
        os_log("%@", log: log, type: type, identifierString)
    }
    
}
