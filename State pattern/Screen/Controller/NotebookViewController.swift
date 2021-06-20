//
//  NotebookViewController.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

protocol NotebookViewDelegate: ViewDelegateProtocol {
    
}

final class NotebookViewController: NibViewController<NotebookContentView> {
    
    private let presenter: NotebookViewPresetnerInterface = NotebookViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupViewDelegate(self)
    }
    
}

extension NotebookViewController: NotebookViewDelegate { }
