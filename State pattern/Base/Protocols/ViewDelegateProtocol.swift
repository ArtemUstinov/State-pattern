//
//  ViewDelegateProtocol.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import Foundation

protocol ViewDelegateProtocol: NSObjectProtocol {
    
    func displayError(_ error: Networking.Error)
    func displayError(_ error: Error)
    
}

extension ViewDelegateProtocol {
    
    func displayError(_ error: Networking.Error) { }
    func displayError(_ error: Error) { }
    
}
