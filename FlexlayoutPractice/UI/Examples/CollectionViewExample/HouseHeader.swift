//
//  HouseHeader.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/16/23.
//

import UIKit

class HouseHeader: UICollectionReusableView {
    
    static let id = "HouseHeader"
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "HouseHeader"
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        addSubview(headerLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.pin.horizontally(pin.safeArea.left + 20).vCenter()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headerLabel.text = ""
    }
    
    
    
}
