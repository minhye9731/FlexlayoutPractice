//
//  IntroViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/10/23.
//

import UIKit

class IntroViewController: BaseViewController {
    
    fileprivate var mainView: IntroView {
        return self.view as! IntroView
    }

    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = IntroView()
    }
}
