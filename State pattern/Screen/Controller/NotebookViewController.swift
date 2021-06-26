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
    private lazy var state = State.transitionToState(.empty, viewController: self)
    
    private let presenter: NotebookViewPresetnerInterface = NotebookViewPresenter()
    
    private let basicNotebookCellConfigurator: BasicNotebookCellConfigurator<User> =
        .init(nameLabelKeyPath: \.name,
              usernameLabelKeyPath: \.username)
    
    //MARK: - Override methods:
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupViewDelegate(self)
        presenter.fetchUsers()
        setPullToRefresh()
        setupNavBar()
    }
    
    //MARK: - Private methods:
    private func setupNavBar() {
        title = "Users"
        
        let clearAllBarButton: UIBarButtonItem = .init(title: "Clear all",
                                                       style: .done,
                                                       target: self,
                                                       action: #selector(handleClearAllBarButton))
        
        clearAllBarButton.tintColor = .red
        navigationItem.rightBarButtonItem = clearAllBarButton
    }
    
    private func setPullToRefresh() {
        contentView.tableView.refreshControl = UIRefreshControl()
        contentView.tableView.refreshControl?.addTarget(self,
                                                        action: #selector(handlePullToRefresh),
                                                        for: .valueChanged)
    }
    
    private func endRefreshing() {
        guard contentView.tableView.refreshControl?.isRefreshing ?? false else { return }
        contentView.tableView.refreshControl?.endRefreshing()
    }
    
    //MARK: - @Objc methods:
    @objc private func handlePullToRefresh(control: UIRefreshControl) {
        control.beginRefreshing()
        presenter.refresh()
    }
    
    @objc private func handleClearAllBarButton(sender: UIBarButtonItem) {
        let kind: State.Kind = .empty
        state = State.transitionToState(kind, viewController: self)
        self.state.enter()
    }
}

//MARK: - UITableViewDataSource & Delegate:
extension NotebookViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let showingData = state as? ShowingDataState else { return 1 }
        return showingData.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch state {
        case let data as ShowingDataState:
            let user = data.users[indexPath.row]
            let cell: BasicNotebookTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            basicNotebookCellConfigurator.configure(cell, for: user)
            return cell
            
        case is LoadingState:
            let cell: LoadingStateNotebookTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
            
        case let error as ErrorState:
            let cell: ErrorStateNotebookTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.error = error.error
            return cell
            
        case is EmptyState:
            let cell: EmptyStateNotebookTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
            
        default:
            return UITableViewCell(style: .default, reuseIdentifier: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch state {
        case is ShowingDataState:
            return 80
        default:
            return tableView.bounds.height
        }
    }
}

//MARK: - NotebookViewDelegate:
extension NotebookViewController: NotebookViewDelegate {
    
    func successfulLoadUsers(_ notebookViewPresenter: NotebookViewPresetnerInterface, users: [User]) {
        contentView.activityIndicator.stopAnimating()
        let kind: State.Kind = users.isEmpty ? .empty : .showingData(users)
        state = State.transitionToState(kind, viewController: self)
        self.state.enter()
        endRefreshing()
    }
    
    func displayError(_ error: Networking.Error) {
        contentView.activityIndicator.stopAnimating()
        let kind: State.Kind = .error(error)
        state = State.transitionToState(kind, viewController: self)
        self.state.enter()
        let alertController = AlertControllerFactory.controller(ofType: .error(error: error))
        present(alertController, animated: true)
    }
}
