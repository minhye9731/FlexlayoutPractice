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
    
    let mainView = SampleView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.isHeroEnabled = true

        mainView.label1.text = "text1"
        mainView.label2.text = "text2"
        mainView.backbutton.setTitle("뒤로가기", for: .normal)
        mainView.backgroundColor = .yellow
        
        mainView.backbutton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        self.isHeroEnabled = true
        self.hero.modalAnimationType = .selectBy(presenting: .fade, dismissing: .fade)

    }
    
    @objc func didTapButton() {
        self.dismiss(animated: true)
    }


    override func viewWillAppear(_ animated: Bool) {
//        enableHero()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        disableHero()
    }
}

