//
//  NotebookViewController + State.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit


extension NotebookViewController {
    
    class State {
        
        enum Kind {
            case empty
            case error(Error)
            case loading
            case showingData([User])
        }
        
        weak var viewController: NotebookViewController?
        
        init(viewController: NotebookViewController) {
            self.viewController = viewController
        }
        
        static func transitionToState(_ kind: Kind, viewController: NotebookViewController) -> State {
            switch kind {
            case .empty:
                return EmptyState(viewController: viewController)
            case .error(let error):
                return ErrorState(error: error,
                                  viewController: viewController)
            case .loading:
                return LoadingState(viewController: viewController)
            case .showingData(let users):
                return ShowingDataState(users: users,
                                        viewController: viewController)
            }
        }
        
        func enter() {
            viewController?.contentView.tableView.reloadData()
        }
    }
}

//MARK: - States:
extension NotebookViewController {
    
    final class EmptyState: State { }
    
    final class ErrorState: State {
        
        let error: Error
        
        init(error: Error, viewController: NotebookViewController) {
            self.error = error
            super.init(viewController: viewController)
        }
    }
    
    final class LoadingState: State { }
    
    final class ShowingDataState: State {
        
        var users: [User]
        
        var isEmptyUsers: Bool {
            users.isEmpty
        }
        
        init(users: [User], viewController: NotebookViewController) {
            self.users = users
            super.init(viewController: viewController)
        }
    }
}


