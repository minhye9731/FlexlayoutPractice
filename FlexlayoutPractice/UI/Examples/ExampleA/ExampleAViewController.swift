//
//  ExampleAViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/14/23.
//

import UIKit

class ExampleAViewController: BaseViewController {
    
    fileprivate var mainView: ExampleAView {
        return self.view as! ExampleAView
    }
    
    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = ExampleAView()
    }
}
