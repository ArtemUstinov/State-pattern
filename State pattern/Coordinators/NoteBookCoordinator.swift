//
//  NotebookCoordinator.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit

protocol NotebookCoordinatorInterface: class {
    var window: UIWindow { get }
    var rootViewController: UINavigationController { get }
}

final class NotebookCoordinator: Coordinator, NotebookCoordinatorInterface {
    
    //MARK: - Public properties:
    var window: UIWindow
    var rootViewController: UINavigationController
    
    var navigationController: UINavigationController {
        return rootViewController
    }
    
    //MARK: - Initializers:
    init(window: UIWindow) {
        self.window = window
        
        let notebookViewController = NotebookViewController()
        let navigationController = UINavigationController(rootViewController: notebookViewController)
        self.rootViewController = navigationController
    }
    
    //MARK: - Public methods:
    func start() {
        window.rootViewController = rootViewController
    }
}
