//
//  MethodGroupHeader.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/12/23.
//

import UIKit

class MethodGroupHeader: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = "MethodGroupHeader"
    static let height: CGFloat = 50
    
    fileprivate let titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.sizeToFit()
        addSubview(titleLabel)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) 제대로 실행 안됨")
    }
    
    func configure(title: String) {
        titleLabel.text = title
        titleLabel.sizeToFit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.pin.horizontally(pin.safeArea.left + 12).vCenter()
    }
    
    
    
}
