//
//  ExampleAView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/14/23.
//

import UIKit
import PinLayout
import FlexLayout

class ExampleAView: UIView {
    
    fileprivate let rootFlexContainer = UIView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        rootFlexContainer.backgroundColor = .systemPink
        
        // padding은 inset같은 존재
        // margin은 외부와의 간격
        rootFlexContainer.flex.direction(.row).padding(40).margin(20).define { flex in
            flex.addItem().width(40).marginEnd(4).backgroundColor(.flexLayoutColor)
            flex.addItem().height(20).alignSelf(.center).grow(2).backgroundColor(.black)
        }
        
        addSubview(rootFlexContainer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rootFlexContainer.pin.top(pin.safeArea).horizontally(pin.safeArea).height(200)
        rootFlexContainer.flex.layout(mode: .fitContainer)
    }
    
}
