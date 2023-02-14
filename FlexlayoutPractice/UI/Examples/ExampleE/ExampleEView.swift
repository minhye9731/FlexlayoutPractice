//
//  ExampleEView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/15/23.
//

import UIKit
import FlexLayout
import PinLayout

class ExampleEView: UIView {
    fileprivate let rootFlexContainer = UIView()

    init() {
        super.init(frame: .zero)
        backgroundColor = .white

        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        rootFlexContainer.backgroundColor = .systemPink
        
        rootFlexContainer.flex.define { flex in
            flex.addItem(imageView).grow(1)
            
            flex.addItem().direction(.row).padding(20).alignItems(.center).define { flex in
                flex.addItem().size(50).backgroundColor(.flexLayoutColor)
                flex.addItem().height(25).marginStart(60).grow(1).backgroundColor(.black)
            }
        }
        addSubview(rootFlexContainer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
        rootFlexContainer.pin.top(pin.safeArea).horizontally(pin.safeArea).height(300)

        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout()
    }
}

