//
//  ExampleBViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/14/23.
//

import UIKit

class ExampleBViewController: BaseViewController {
    
    fileprivate var mainView: ExampleBView {
        return self.view as! ExampleBView
    }
    
    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = ExampleBView()
    }
    
}
