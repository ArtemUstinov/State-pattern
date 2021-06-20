//
//  NotebookViewPresenter.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

protocol NotebookViewPresetnerInterface {
    func setupViewDelegate(_ delegate: NotebookViewDelegate)
}

final class NotebookViewPresenter: NotebookViewPresetnerInterface {
    
    private weak var viewDelegate: NotebookViewDelegate?
    
    func setupViewDelegate(_ delegate: NotebookViewDelegate) {
        self.viewDelegate = delegate
    }
    
}
