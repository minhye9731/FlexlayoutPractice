//
//  ViewController.swift
//  FlexlayoutPractice
//
//  Created by 강민혜 on 2/1/23.
//

import UIKit
import PinLayout
import FlexLayout

class ViewController: UIViewController {
    
//    let mainView = SampleView()
    let roofFlexContainer: UIView = UIView()
    let label1: UILabel = UILabel()
    let label2: UILabel = UILabel()
    let label3: UILabel = UILabel()
    
    override func loadView() {
//        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mainView.label1.text = "text1"
//        mainView.label2.text = "text2"
//        mainView.backgroundColor = .yellow
        
        self.view.addSubview(roofFlexContainer)
        self.roofFlexContainer.flex.define { flex in
            flex.addItem(label1)
            flex.addItem(label2)
            flex.addItem(label3)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        roofFlexContainer.pin.all()
        roofFlexContainer.flex.layout()
        
        
    }


}

