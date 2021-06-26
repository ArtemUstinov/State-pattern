//
//  NotebookContentView.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

protocol NotebookContentViewInterface: class {
    var tableView: UITableView! { get }
    var activityIndicator: UIActivityIndicatorView { get }
}

final class NotebookContentView: UIView, NibViewInterface, NotebookContentViewInterface {
    
    static let nib: UINib = UINib(nibName: "NotebookContentView", bundle: nil)
    
    //MARK: - @IBOutlet:
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Public properties:
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    //MARK: - Override methods:
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }
    
    //MARK: - Private methods:
    func setupTableView() {
        tableView.register(BasicNotebookTableViewCell.self)
        tableView.register(EmptyStateNotebookTableViewCell.self)
        tableView.register(ErrorStateNotebookTableViewCell.self)
        tableView.register(LoadingStateNotebookTableViewCell.self)
    }
}
