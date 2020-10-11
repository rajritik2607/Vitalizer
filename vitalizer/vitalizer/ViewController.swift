//
//  ViewController.swift
//  vitalizer
//
//  Created by riddhi gupta on 10/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension UIButton{
    func applyDesign(){
        self.layer.cornerRadius = 15
        self.setTitleColor(UIColor.white, for: .normal)
    }
}
