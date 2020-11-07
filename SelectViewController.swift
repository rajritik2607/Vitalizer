//
//  SelectViewController.swift
//  vitalizer
//
//  Created by Ritik Suryawanshi on 11/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet weak var covidTest: UIButton!
    
    @IBOutlet weak var heartTest: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        covidTest.layer.borderWidth = 2
        covidTest.layer.borderColor = UIColor.black.cgColor
        covidTest.layer.cornerRadius = 25.0
        covidTest.tintColor = UIColor.black
        heartTest.layer.borderWidth = 2
        heartTest.layer.borderColor = UIColor.black.cgColor
        heartTest.layer.cornerRadius = 25.0
        heartTest.tintColor = UIColor.black

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
