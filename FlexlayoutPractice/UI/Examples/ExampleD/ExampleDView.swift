//
//  ExampleDView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/14/23.
//

import UIKit
import FlexLayout
import PinLayout

class ExampleDView: UIView {
    fileprivate let rootFlexContainer = UIView()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        let label = UIView()
        label.backgroundColor = .black
        
        rootFlexContainer.backgroundColor = .systemPink
        
        rootFlexContainer.flex.justifyContent(.start).alignItems(.end).define { flex in
            flex.addItem(imageView).alignSelf(.stretch).grow(1)
            flex.addItem(label).width(300).height(25).margin(20)
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
