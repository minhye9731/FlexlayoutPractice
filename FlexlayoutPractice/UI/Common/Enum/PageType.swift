//
//  PageType.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/9/23.
//

import UIKit

enum PageType: Int {
    case intro
    case rayWenderlich
    case tableview
    case collectionView
    case exampleColumn
    case yogaExampleA
    case yogaExampleB
    case yogaExampleC
    case yogaExampleD
    case yogaExampleE
    case yogaExampleF
    
    var text: String {
        switch self {
        case .intro:          return "Intro Example"
        case .rayWenderlich:  return "Raywenderlich Tutorial"
        case .tableview:      return "UITableView with variable cell's height"
        case .collectionView: return "UICollectionView with variable cell's height"
        case .exampleColumn:  return "Example 1 - Column"
        case .yogaExampleA:   return "Yoga C Example"
        case .yogaExampleB:   return "Yoga Obj-C Example"
        case .yogaExampleC:   return "Yoga Java Example"
        case .yogaExampleD:   return "Yoga C# Example"
        case .yogaExampleE:   return "Yoga Android Example"
        case .yogaExampleF:   return "Yoga Baseline Example"
        }
    }

    var viewController: UIViewController {
        switch self {
        case .intro:          return IntroViewController(pageType: self)
        case .rayWenderlich:  return RayWenderlichTutorialViewController(pageType: self)
        case .tableview:      return TableViewExampleViewController(pageType: self)
        case .collectionView: return CollectionViewExampleViewController(pageType: self)
        case .exampleColumn:  return Example1ViewController(pageType: self)
        case .yogaExampleA:   return YogaExampleAViewController(pageType: self)
        case .yogaExampleB:   return YogaExampleBViewController(pageType: self)
        case .yogaExampleC:   return YogaExampleCViewController(pageType: self)
        case .yogaExampleD:   return YogaExampleDViewController(pageType: self)
        case .yogaExampleE:   return YogaExampleEViewController(pageType: self)
        case .yogaExampleF:   return YogaExampleFViewController(pageType: self)
        }
    }
}

