//
//  BasicNotebookTableViewCell.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit

final class BasicNotebookTableViewCell: UITableViewCell, BasicNotebookTableViewCellInterface {
    
    //MARK: - @IBOutlets:
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    //MARK: - Override methods:
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        usernameLabel.text = nil
    }
}
