//
//  NoteBookViewPresenter.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

protocol NoteBookViewPresetnerInterface {
    func setupViewDelegate(_ delegate: NoteBookViewDelegate)
}

final class NoteBookViewPresenter: NoteBookViewPresetnerInterface {
    
    private weak var viewDelegate: NoteBookViewDelegate?
    
    func setupViewDelegate(_ delegate: NoteBookViewDelegate) {
        self.viewDelegate = delegate
    }
    
}
