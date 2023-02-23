//
//  IntroView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/10/23.
//

import UIKit
import FlexLayout
import PinLayout

class IntroView: UIView {
    
    fileprivate let rootFlexContainer = UIView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(systemName: "star"))
        let segmentedControl = UISegmentedControl(items: ["Intro", "FlexLayout", "PinLayout"])
        segmentedControl.selectedSegmentIndex = 0
        
        let label = UILabel()
        label.text = "FlexLayout 연습 프로젝트입니다. \n\nFlexLayout 샘플 프로젝트를 참고해서 연습을 하고 있어요"
        label.numberOfLines = 0
        
        let bottomLabel = UILabel()
        bottomLabel.text = "FlexLayout/yoga가 빠르다고 하네"
        bottomLabel.numberOfLines = 0
        
        rootFlexContainer.flex.direction(.column).padding(20).define { flex in
            
            flex.addItem().direction(.row).define { flex in
                flex.addItem(imageView).width(100).aspectRatio(of: imageView)
                flex.addItem().direction(.column).paddingLeft(12).grow(1).backgroundColor(.yellow).define { flex in
//                    flex.addItem(segmentedControl).marginBottom(12).shrink(1)
                    flex.addItem(label).marginBottom(10)
                    flex.addItem(bottomLabel)
                }
            }
            
            flex.addItem().height(1).marginTop(12).backgroundColor(.lightGray)
            flex.addItem(bottomLabel).marginTop(12)
        }
        
        addSubview(rootFlexContainer)
    }
    
    required init?(coder eDecoder: NSCoder) {
        super.init(coder: eDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 1) PinLayout 사용해서 rootFlexContainer의 layout을 먼저 잡아줌
        // (rootFlexContainer의 frame으로 바로 layout을 직접적으로 설정할 수도 있음)
        rootFlexContainer.pin.top().horizontally().margin(pin.safeArea)
        
        // 2) 그리고나서 flexbox 컨테이너 자체의 layout을 잡아준다.
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
}
