//
//  BasicNotebookCellConfigurator.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import Foundation

struct BasicNotebookCellConfigurator<Model> {
    
    //MARK: - Public properties:
    var nameLabelKeyPath: KeyPath<Model, String?>
    var usernameLabelKeyPath: KeyPath<Model, String?>
    
    //MARK: - Public methods:
    func configure(_ cell: BasicNotebookTableViewCellInterface, for model: Model) {
        setNameLabel(in: cell, for: model)
        setUsernameLabel(in: cell, for: model)
    }
    
    //MARK: - Private methods:
    private func setNameLabel(in cell: BasicNotebookTableViewCellInterface, for model: Model) {
        cell.nameLabel.text = model[keyPath: nameLabelKeyPath]
    }
    
    private func setUsernameLabel(in cell: BasicNotebookTableViewCellInterface, for model: Model) {
        cell.usernameLabel.text = model[keyPath: usernameLabelKeyPath]
    }
}
