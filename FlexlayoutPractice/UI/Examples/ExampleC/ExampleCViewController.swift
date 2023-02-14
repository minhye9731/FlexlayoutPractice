//
//  ExampleCViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/14/23.
//

import UIKit

class ExampleCViewController: BaseViewController {
    
    fileprivate var mainView: ExampleCView {
        return self.view as! ExampleCView
    }

    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = ExampleCView()
    }
}
