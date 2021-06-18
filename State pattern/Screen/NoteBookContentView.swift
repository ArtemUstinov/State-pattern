//
//  NoteBookContentView.swift
//  State pattern
//
//  Created by Work on 18.06.2021.
//

import UIKit

final class NoteBookContentView: UIView, NibViewInterface {
    
    static let nib: UINib = UINib(nibName: "NoteBookContentView", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .blue
    }
    
}
