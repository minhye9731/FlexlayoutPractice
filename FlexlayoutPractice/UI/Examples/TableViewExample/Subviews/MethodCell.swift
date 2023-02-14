//
//  MethodCell.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/12/23.
//

import UIKit
import PinLayout
import FlexLayout

struct Method {
    let name: String
    let description: String
}

class MethodCell: UITableViewCell {
    
    static let reuseIdentifier = "MethodCell"
    fileprivate let padding: CGFloat = 10
    
    fileprivate let nameLabel = UILabel()
    fileprivate let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        separatorInset = .zero
        
        let iconImageView = UIImageView(image: UIImage(systemName: "star"))
        
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        nameLabel.lineBreakMode = .byTruncatingTail
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
        
        contentView.flex.padding(12).define { flex in
            
            flex.addItem().direction(.row).define { flex in
                flex.addItem(iconImageView).size(30)
                flex.addItem(nameLabel).marginLeft(padding).grow(1)
            }
            
            flex.addItem(descriptionLabel).marginTop(padding)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) 제대로 실행 안됨")
    }
    
    func configure(method: Method) {
        nameLabel.text = method.name
        nameLabel.flex.markDirty()
        
        descriptionLabel.text = method.description
        descriptionLabel.flex.markDirty()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    fileprivate func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        contentView.pin.width(size.width)
        
        layout()
        
        return contentView.frame.size
    }
    
}
