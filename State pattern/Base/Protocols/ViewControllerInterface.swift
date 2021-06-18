//
//  ViewControllerInterface.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

protocol ViewControllerInterface: class {
    
    associatedtype ContentView
    
    var contentView: ContentView { get }
    
    func loadContentView() -> ContentView
    
}

extension ViewControllerInterface where Self: UIViewController {
    
    var contentView: ContentView {
        return view as! ContentView
    }
    
}

extension ViewControllerInterface where ContentView: NibViewInterface {
    
    func loadContentView() -> ContentView {
        return ContentView.loadFromNib(owner: self, options: nil)
    }
    
}
