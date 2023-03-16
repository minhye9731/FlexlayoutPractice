//
//  sampleView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/1/23.
//

import Foundation
import UIKit
import PinLayout
import FlexLayout


final class SampleView: UIView {
    
    let flexContainer = UIView()
    
    let label1 = UILabel()
    let label2 = UILabel()
    let backbutton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.flexContainer)
        
        self.flexContainer.flex
            .direction(.row)
            .justifyContent(.start)
            .alignItems(.center)
            .define { flex in
                flex.addItem(self.label1).marginEnd(6)
                flex.addItem(self.label2).marginEnd(18)
                flex.addItem(self.backbutton)
            }
        update()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.flexContainer.pin.all(self.pin.safeArea)
        self.flexContainer.flex.layout()
    }
    
    func update() {
        self.layoutIfNeeded()
    }
    
}
