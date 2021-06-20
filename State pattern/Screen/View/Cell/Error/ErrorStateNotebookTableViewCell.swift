//
//  ErrorStateNotebookTableViewCell.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit

protocol ErrorStateNotebookTableViewCellInterface: class {
    var errorLabel: UILabel! { get }
    var error: Error? { get }
}

final class ErrorStateNotebookTableViewCell: UITableViewCell, ErrorStateNotebookTableViewCellInterface {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var error: Error? {
        didSet {
            guard let error = error else { return }
            errorLabel.text = error.localizedDescription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
