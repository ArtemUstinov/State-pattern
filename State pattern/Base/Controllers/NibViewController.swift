//
//  NibViewController.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

class NibViewController<ContentView: UIView & NibViewInterface>: ViewController<ContentView> {
    
    override func loadContentView() -> ContentView {
        return ContentView.loadFromNib(owner: self, options: nil)
    }
    
}
