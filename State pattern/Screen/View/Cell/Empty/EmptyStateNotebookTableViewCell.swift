//
//  EmptyStateNotebookTableViewCell.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit

final class EmptyStateNotebookTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
