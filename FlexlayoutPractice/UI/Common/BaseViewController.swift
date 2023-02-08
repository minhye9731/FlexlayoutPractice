//
//  BaseViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/8/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "이전", style: .plain, target: nil, action: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
