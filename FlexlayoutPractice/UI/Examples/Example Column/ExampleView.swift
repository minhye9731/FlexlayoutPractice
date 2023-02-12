//
//  ExampleView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/13/23.
//

import UIKit
import PinLayout
import FlexLayout

class ExampleView: UIView {
    fileprivate let rootFlexContainer = UIView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        let view1 = BasicView(text: "View 1")
        let view2 = BasicView(text: "View 2")
        let view3 = BasicView(text: "View 3")
        
        rootFlexContainer.flex.justifyContent(.spaceEvenly).padding(16).define { flex in
            flex.addItem(view1).height(40)
            flex.addItem(view2).height(40).marginTop(10)
            flex.addItem(view3).height(40).marginTop(10)
        }
        
        addSubview(rootFlexContainer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        rootFlexContainer.pin.all(pin.safeArea)
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
}
