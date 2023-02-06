//
//  CountingView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/6/23.
//

import UIKit
import FlexLayout
import PinLayout

class CountingView: UIView {
    // 1. root view될 컨테이너 선언
    fileprivate let rootFlexContainer = UIView()
    
    // 2. container 안에 들어갈 item들 선언 및 추가
    let plusButton = UIButton(configuration: .filled())
    let subtractButton = UIButton(configuration: .filled())
    let count = UILabel()
    let footer = UILabel()
    
    init() {
        // init 내부에 아이템들 생성
        super.init(frame: .zero)
        backgroundColor = .white
        
        // button 설정
        plusButton.setTitle("+", for: .normal)
        subtractButton.setTitle("-", for: .normal)
        
        // label 설정
        count.textAlignment = .center
        count.font = UIFont.systemFont(ofSize: 60.0)
        
        // footerLabel 설정
        footer.text = "https://m.naver.com"
        
        // 생성한 item 배치
        rootFlexContainer.flex.width(100%).direction(.column).padding(12).define { flex in
            
            // 첫 번째 행 - button
            flex.addItem().direction(.row).justifyContent(.spaceBetween).define { flex in
                flex.addItem(plusButton).grow(1).marginRight(10)
                flex.addItem(subtractButton).grow(1)
            }
            
            // 두 번째 행 - label
            flex.addItem().direction(.row).justifyContent(.center).define { flex in
                flex.addItem().direction(.column).paddingLeft(12).define { flex in
                    flex.addItem(count)
                }
            }
            
            // 마지막 - footer label
            flex.addItem().height(1).marginTop(12).backgroundColor(.lightGray)
            flex.addItem(footer).marginTop(12)
        }
        addSubview(rootFlexContainer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 부모뷰에 대한 container 레이아웃 설정 (safearea 맞춤)
        rootFlexContainer.pin.all(pin.safeArea)
        // container 사이즈 설정 (내부 아이템 높이에 맞춰서)
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
    
}
