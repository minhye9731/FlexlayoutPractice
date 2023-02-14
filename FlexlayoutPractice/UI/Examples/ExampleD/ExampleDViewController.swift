//
//  ExampleDViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/14/23.
//

import UIKit

class ExampleDViewController: BaseViewController {
    fileprivate var mainView: ExampleDView {
        return self.view as! ExampleDView
    }

    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = ExampleDView()
    }
}
