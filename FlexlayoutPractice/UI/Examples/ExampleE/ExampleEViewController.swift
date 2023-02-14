//
//  ExampleEViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/15/23.
//

import UIKit

class ExampleEViewController: BaseViewController {
    fileprivate var mainView: ExampleEView {
        return self.view as! ExampleEView
    }

    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = ExampleEView()
    }
}
