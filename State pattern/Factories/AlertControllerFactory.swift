//
//  AlertControllerFactory.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit

enum AlertControllerFactory {
    
    enum AlertControllerType {
        
        case error(error: Error)
        
    }
    
    static func controller(ofType type: AlertControllerType) -> UIAlertController {
        switch type {
        case let .error(error: error):
            let alertController = UIAlertController(title: "Error",
                                                    message: error.localizedDescription,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok",
                                                    style: .cancel,
                                                    handler: nil))
            return alertController
        }
    }
    
}
