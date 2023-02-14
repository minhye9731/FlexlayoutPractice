//
//  ExampleFViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/15/23.
//

import UIKit

class ExampleFViewController: BaseViewController {
    fileprivate var mainView: ExampleFView {
        return self.view as! ExampleFView
    }

    init(pageType: PageType) {
        super.init()
        title = pageType.text
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        view = ExampleFView()
    }
}
