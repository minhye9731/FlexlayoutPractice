//
//  PageType.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/9/23.
//

import UIKit

enum PageType: Int {
    case intro
//    case rayWenderlich
    case tableview
    case collectionView
    case exampleColumn
    case ExampleA
    case ExampleB
    case ExampleC
    case ExampleD
    case ExampleE
    case ExampleF
    case count
    
    var text: String {
        switch self {
        case .intro:          return "Intro Example"
//        case .rayWenderlich:  return "Raywenderlich Tutorial"
        case .tableview:      return "UITableView with variable cell's height"
        case .collectionView: return "UICollectionView with variable cell's height"
        case .exampleColumn:  return "Example Column"
        case .ExampleA:   return "ExampleA"
        case .ExampleB:   return "ExampleB"
        case .ExampleC:   return "ExampleC"
        case .ExampleD:   return "ExampleD"
        case .ExampleE:   return "ExampleE"
        case .ExampleF:   return "ExampleF"
        case .count:          return ""
        }
    }

    var viewController: UIViewController {
        switch self {
        case .intro:          return IntroViewController(pageType: self)
//        case .rayWenderlich:  return RayWenderlichTutorialViewController(pageType: self)
        case .tableview:      return TableViewExampleViewController(pageType: self)
        case .collectionView: return CollectionViewExampleViewController(pageType: self)
        case .exampleColumn:  return ExampleViewController(pageType: self)
        case .ExampleA:   return ExampleAViewController(pageType: self)
        case .ExampleB:   return ExampleBViewController(pageType: self)
        case .ExampleC:   return ExampleCViewController(pageType: self)
        case .ExampleD:   return ExampleDViewController(pageType: self)
        case .ExampleE:   return ExampleEViewController(pageType: self)
        case .ExampleF:   return ExampleFViewController(pageType: self)
        case .count:          return UIViewController()
        }
    }
}

