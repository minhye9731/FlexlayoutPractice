//
//  ExampleFView.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/15/23.
//

import UIKit
import FlexLayout
import PinLayout

class ExampleFView: UIView {
    
    fileprivate let rootFlexContainer = UIView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        
        rootFlexContainer.backgroundColor = .systemPink
        
        let imageView = UIView()
        imageView.backgroundColor = .flexLayoutColor
        
        rootFlexContainer.flex.padding(20).direction(.column).define {
            
            // 1층
            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {
                let label = UILabel()
                label.font = .systemFont(ofSize: 20)
                label.text = "leading font 입니다"
                
                $0.addItem(label).marginRight(5).markDirty()
                
                let info = UILabel()
                info.font = .systemFont(ofSize: 10)
                info.text = "trailing font 입니다"
                
                $0.addItem(info).markDirty()
            }
            
            // 2층
            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {
                let label = UILabel()
                label.font = .systemFont(ofSize: 20)
                label.text = "leading multiline\n아보카도가 들어있는 부리또 보울이랑 콜라 먹고싶다!"
                label.numberOfLines = 2
                
                $0.addItem(label).marginRight(5).markDirty()
                
                let info = UILabel()
                info.font = .systemFont(ofSize: 10)
                info.text = "trailing font 입니다"
                
                $0.addItem(info).markDirty()
            }
            
            // 3층
            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {
                let label = UILabel()
                label.font = .systemFont(ofSize: 12)
                label.text = "이름: "
                label.numberOfLines = 2
                
                $0.addItem(label).marginRight(5).markDirty()
                
                let info = UITextField()
                info.font = .systemFont(ofSize: 16)
                info.placeholder = "여기에 이름을 입력하세요~"
                
                $0.addItem(info).markDirty()
            }
            
            // 4층
            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {
                let label = UILabel()
                label.font = .systemFont(ofSize: 12)
                label.text = "나이: "
                label.numberOfLines = 2
                
                $0.addItem(label).marginRight(5).markDirty()
                
                let info = UITextField()
                info.borderStyle = .roundedRect
                info.font = .systemFont(ofSize: 16)
                info.placeholder = "여기에 나이를 입력하세요~"
                
                $0.addItem(info).markDirty()
            }
            
            // 5층
            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {
                let label = UILabel()
                label.font = .systemFont(ofSize: 12)
                label.text = "상태: "
                label.numberOfLines = 2
                
                $0.addItem(label).marginRight(5).markDirty()
                
                let info = UITextField()
                info.borderStyle = .line
                info.font = .systemFont(ofSize: 16)
                info.placeholder = "여기에 상태를 입력하세요~"
                
                $0.addItem(info).markDirty()
            }
            
            // 6층
            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {
                let label = UILabel()
                label.font = .systemFont(ofSize: 12)
                label.text = "성별: "
                label.numberOfLines = 2
                
                $0.addItem(label).marginRight(5).markDirty()
                
                let info = UITextField()
                info.borderStyle = .bezel
                info.font = .systemFont(ofSize: 16)
                info.placeholder = "여기에 성별 입력하세요~"
                
                $0.addItem(info).markDirty()
            }
            
            // 7층
            $0.addItem().direction(.row).alignItems(.baseline).marginBottom(20).define {
                let label = UILabel()
                label.font = .systemFont(ofSize: 12)
                label.text = "비고: "
                label.numberOfLines = 2
                
                $0.addItem(label).marginRight(5).markDirty()
                
                let info = UITextView()
                info.font = .systemFont(ofSize: 16)
                info.text = "여기에 기타 정보를 입력하세요~"
                
                $0.addItem(info).grow(1).height(200).markDirty()
            }
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
