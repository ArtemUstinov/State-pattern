//
//  NotebookViewPresenter.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

protocol NotebookViewPresetnerInterface {
    var users: [User] { get }
    
    func setupViewDelegate(_ delegate: NotebookViewDelegate)
}

final class NotebookViewPresenter: NotebookViewPresetnerInterface {
    
    private weak var viewDelegate: NotebookViewDelegate?
    
    //MARK: - Public properties:
    var users: [User] = []
    
    //MARK: - Public methods:
    func setupViewDelegate(_ delegate: NotebookViewDelegate) {
        self.viewDelegate = delegate
    }
    
    //MARK: - Public methods:
    func fetchUsers() {
        let request = NotebookRouter.user
        Networking.request(request) { (result: Result<[User], Networking.Error>) in
            switch result {
            case .success(let users):
                self.users = users
                self.viewDelegate?.successfulLoadUsers(self, users: self.users)
                
            case .failure(let error):
                self.viewDelegate?.displayError(error)
                LogService.log("Error: \(error). Loc: \(error.localizedDescription)",
                               log: .default,
                               type: .error)
            }
        }
    }
}
