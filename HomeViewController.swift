//
//  HomeViewController.swift
//  vitalizer
//
//  Created by riddhi gupta on 10/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var taketest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         taketest.layer.borderWidth = 2
         taketest.layer.borderColor = UIColor.black.cgColor
         taketest.layer.cornerRadius = 25.0
         taketest.tintColor = UIColor.black
         
view.setGradientBackground(colorOne: Colors.bottomRight, colorTwo: Colors.topLeft)
        // Do any additional setup after loading the view.
    }
    
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
