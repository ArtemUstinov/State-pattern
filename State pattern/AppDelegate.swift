//
//  AppDelegate.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: - Public properties:
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    //MARK: - Public methods:
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        self.window = window
        window.makeKeyAndVisible()
        return true
    }
}

