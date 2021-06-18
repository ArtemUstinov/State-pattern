//
//  NoteBookViewController.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

protocol NoteBookViewDelegate: ViewDelegateProtocol {
    
}

final class NoteBookViewController: NibViewController<NoteBookContentView> {
    
    private let presenter: NoteBookViewPresetnerInterface = NoteBookViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupViewDelegate(self)
    }
    
}

extension NoteBookViewController: NoteBookViewDelegate { }
