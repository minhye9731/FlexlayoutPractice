//
//  HouseHeader.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/16/23.
//

import UIKit
import PinLayout
import FlexLayout

class HouseHeader: UICollectionReusableView {
    
    static let id = "HouseHeader"
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        self.headerLabel.sizeToFit() // 포인트
        addSubview(headerLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
        headerLabel.pin.horizontally(pin.safeArea.left + 20).vCenter()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.prepare(title: nil)
    }
    
    func prepare(title: String?) {
        print("\(title)")
        self.headerLabel.text = title
        self.headerLabel.sizeToFit() // 포인트
    }
    
}
