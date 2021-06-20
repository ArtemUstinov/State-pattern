//
//  AppCoordinator.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit

protocol AppCoordinatorInterface: class {
    var window: UIWindow { get }
    var notebookCoordinator: NotebookCoordinator? { get }
    func start()
}

final class AppCoordinator: AppCoordinatorInterface {
    
    //MARK: - Public properties:
    var window: UIWindow
    
    var notebookCoordinator: NotebookCoordinator?
    
    //MARK: - Initializers:
    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Public methods:
    func start() {
        openNotebookCoordinator()
    }
    
    //MARK: - Private methods:
    private func openNotebookCoordinator() {
        let notebookCoordinator = NotebookCoordinator(window: window)
        self.notebookCoordinator = notebookCoordinator
        notebookCoordinator.start()
    }
}
