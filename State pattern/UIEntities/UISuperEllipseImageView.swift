//
//  UISuperEllipseImageView.swift
//  State pattern
//
//  Created by Work on 20.06.2021.
//

import UIKit

class UISuperEllipseImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = bounds.size.height * 0.25
        layer.cornerCurve = .continuous
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
