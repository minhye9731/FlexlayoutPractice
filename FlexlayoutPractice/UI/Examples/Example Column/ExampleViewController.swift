//
//  ExampleViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/13/23.
//

import UIKit

class ExampleViewController: BaseViewController {
    fileprivate var mainView: ExampleView {
        return self.view as! ExampleView
    }
    
    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = ExampleView()
    }
}
