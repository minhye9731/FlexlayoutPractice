//
//  ExampleCView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/14/23.
//

import UIKit
import FlexLayout
import PinLayout

class ExampleCView: UIView {
    
    fileprivate let rootFlexContainer = UIView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        let label = UIView()
        label.backgroundColor = .black
        
        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        rootFlexContainer.backgroundColor = .systemPink
        
        rootFlexContainer.flex.alignItems(.center).justifyContent(.center).padding(20).define { flex in
            flex.addItem(label).width(200).height(25)
            flex.addItem(imageView).position(.absolute).top(20).end(10).size(100)
        }
        addSubview(rootFlexContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rootFlexContainer.pin.top(pin.safeArea).horizontally(pin.safeArea).height(300)
        rootFlexContainer.flex.layout()
    }
}
