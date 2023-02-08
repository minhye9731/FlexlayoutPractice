//
//  MenuViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/9/23.
//

import UIKit

class MenuViewController: BaseViewController {
    fileprivate var mainView: MenuView {
        return self.view as! MenuView
    }

    override init() {
        super.init()
        title = "FlexLayout 연습"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MenuView()
        mainView.delegate = self
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        didSelect(pageType: .collectionView)
//    }
}

// MARK: MenuViewDelegate
extension MenuViewController: MenuViewDelegate {
    
    func didSelect(pageType: PageType) {
        navigationController?.pushViewController(pageType.viewController, animated: true)
    }
}
