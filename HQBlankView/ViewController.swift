//
//  ViewController.swift
//  HQBlankView
//
//  Created by gandijun on 2018/6/1.
//  Copyright © 2018年 HeQing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func showBlankView(_ sender: UIButton) {
        
        HQBlankView.show(view, imgStr: "noTest", title: "咱无考试记录") {
            HQBlankView.hide(fromView: self.view)
        }
    }
}

