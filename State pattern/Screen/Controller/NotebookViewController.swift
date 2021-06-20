//
//  NotebookViewController.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

protocol NotebookViewDelegate: ViewDelegateProtocol {
    func successfulLoadUsers(_ notebookViewPresenter: NotebookViewPresetnerInterface, users: [User])
}

final class NotebookViewController: NibViewController<NotebookContentView> {
    
    //MARK: - Private properties:
    private lazy var state = State.state(.empty, viewController: self)
    
    private let presenter: NotebookViewPresetnerInterface = NotebookViewPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupViewDelegate(self)
    }
    
}

//MARK: - NotebookViewDelegate:
extension NotebookViewController: NotebookViewDelegate {
    
    func successfulLoadUsers(_ notebookViewPresenter: NotebookViewPresetnerInterface, users: [User]) {
        contentView.activityIndicator.stopAnimating()
        let kind: State.Kind = users.isEmpty ? .empty : .showingData(users)
        state = State.state(kind, viewController: self)
        self.state.enter()
    }
    
    func displayError(_ error: Error) {
        let alertController = AlertControllerFactory.controller(ofType: .error(error: error))
        present(alertController, animated: true)
    }
}
