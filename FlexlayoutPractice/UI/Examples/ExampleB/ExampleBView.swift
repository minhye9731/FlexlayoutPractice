//
//  ExampleBView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/14/23.
//

import UIKit
import FlexLayout
import PinLayout

class ExampleBView: UIView {
    
    fileprivate let rootFlexContainer = UIView()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        rootFlexContainer.backgroundColor = .systemPink
        
        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UIView()
        label.backgroundColor = .black
        
        rootFlexContainer.flex.alignItems(.center).justifyContent(.start).padding(20).define { flex in
            flex.addItem(imageView).size(150).aspectRatio(1).marginBottom(20)
            flex.addItem(label).width(100).height(25)
        }
        addSubview(rootFlexContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rootFlexContainer.pin.top(pin.safeArea).horizontally(pin.safeArea).height(500)
        rootFlexContainer.flex.layout()
    }
    
}
