//
//  RayWenderlichTutorialViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/11/23.
//

//import UIKit
//
//class RayWenderlichTutorialViewController: BaseViewController {
//
//    fileprivate var mainView: RayWenderlichTutorialView {
//        return self.view as! RayWenderlichTutorialView
//    }
//
//    init(pageType: PageType) {
//        super.init()
//        title = pageType.text
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
//    fileprivate func loadShows() -> [Show] {
//        guard let path = Bundle.main.path(forResource: "Shows", ofType: "plist"),
//              let dictArray = NSArray(contentsOf: path) as? [[String: AnyObject]] else {
//            return []
//        }
//    }
//
//    var shows: [Show] = []
//
//    dictArray.forEach {
//
//    }
//
//}
