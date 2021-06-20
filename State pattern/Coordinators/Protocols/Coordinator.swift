//
//  Coordinators.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit

protocol Coordinator: class {
    
    var navigationController: UINavigationController { get }
        
    func start()
    
}
