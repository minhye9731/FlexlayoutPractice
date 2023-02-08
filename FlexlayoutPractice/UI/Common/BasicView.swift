//
//  BasicView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/8/23.
//

import UIKit

class BasicView: UIView {
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    init(text: String? = nil) {
        super.init(frame: .zero)

        backgroundColor = .lightGray
        label.text = text
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
               
        addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
            
        label.pin.center()
    }
    
    var sizeThatFitsExpectedArea: CGFloat = 40 * 40
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        var newSize = CGSize()
        
        if size.width != CGFloat.greatestFiniteMagnitude {
            newSize.width = size.width
            newSize.height = sizeThatFitsExpectedArea / newSize.width
        } else if size.height != CGFloat.greatestFiniteMagnitude {
            newSize.height = size.height
            newSize.width = sizeThatFitsExpectedArea / newSize.height
        } else {
            newSize.width = 40
            newSize.height = sizeThatFitsExpectedArea / newSize.width
        }
        
        return newSize
    }
}
