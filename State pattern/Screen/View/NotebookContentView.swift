//
//  NotebookContentView.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

protocol NotebookContentViewInterface: class {
    var tableView: UITableView! { get }
}

final class NotebookContentView: UIView, NibViewInterface {
    
    static let nib: UINib = UINib(nibName: "NotebookContentView", bundle: nil)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
