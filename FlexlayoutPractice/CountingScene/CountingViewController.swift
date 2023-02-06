//
//  CountingViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/6/23.
//

import UIKit

final class CountingViewController: UIViewController {
    
    // flexlayout 적용한 view 인스턴스 생성
    fileprivate let mainView = CountingView()
    
    // 내부적으로 카운트할 변수
    var count: Int = 0
    
    override func loadView() {
        // flexlayout 뷰 지정
        view = mainView
        
        // 뷰 초기화 및 버튼 액션 연결
        mainView.count.text = "\(count)"
        mainView.plusButton.addTarget(self, action: #selector(plusCount(_:)), for: .touchUpInside)
        mainView.subtractButton.addTarget(self, action: #selector(subtractCount(_:)), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - 액션
    @objc func plusCount(_: UIButton!) {
        count += 1
        mainView.count.text = "\(count)"
    }
    
    @objc func subtractCount(_: UIButton!) {
        count -= 1
        mainView.count.text = "\(count)"
    }
    
    
}
