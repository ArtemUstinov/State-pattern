//
//  ViewController.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

class ViewController<ContentView: UIView>: UIViewController, ViewControllerInterface {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    final override func loadView() {
        view = loadContentView()
    }
    
    func loadContentView() -> ContentView {
        fatalError("Should be overriden")
    }
    
}
