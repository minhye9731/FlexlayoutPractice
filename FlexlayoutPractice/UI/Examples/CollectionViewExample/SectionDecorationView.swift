//
//  SectionDecorationView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 3/20/23.
//

import UIKit

class SectionDecorationView: UICollectionReusableView {
    static let id = "SectionDecorationView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setupViewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    func configure() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}
