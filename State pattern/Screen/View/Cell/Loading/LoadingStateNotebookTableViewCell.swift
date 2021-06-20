//
//  LoadingStateNotebookTableViewCell.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit

protocol LoadingStateNotebookTableViewCellInterface: class {
    var activityIndicator: UIActivityIndicatorView! { get }
}

final class LoadingStateNotebookTableViewCell: UITableViewCell, LoadingStateNotebookTableViewCellInterface {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        activityIndicator.startAnimating()
    }
}
