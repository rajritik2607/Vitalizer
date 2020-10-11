//
//  StartViewController.swift
//  vitalizer
//
//  Created by riddhi gupta on 10/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
struct Colors {
    
    static let buttonLeft = UIColor(red: 5.0/255.0, green: 118.0/255.0, blue: 255.0/255.0, alpha: 100.0)
    static let buttonRight = UIColor(red: 104.0/255.0, green: 14.0/255.0, blue: 255.0/255.0, alpha: 100.0)
    static let topLeft = UIColor(red: 229.0/255.0, green: 236.0/255.0, blue: 255.0/255.0, alpha: 100)
    static let bottomRight = UIColor(red: 251.0/255.0, green: 229.0/255.0, blue: 255.0/255.0, alpha: 100)
    static let green            = UIColor(red: 91.0/255.0, green: 197.0/255.0, blue: 159.0/255.0, alpha: 1.0)
    static let red  = UIColor(red: 255.0/255.0, green: 86.0/255.0, blue: 120.0/255.0, alpha: 100)
    static let veryDarkGrey     = UIColor(red: 13.0/255.0, green: 13.0/255.0, blue: 13.0/255.0, alpha: 1.0)
    static let lightGrey        = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
    static let black            = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static let white            = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
}

class StartViewController: UIViewController {

    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        signUp.applyDesign()
        login.applyDesign()
        login.setGradientBackground(colorOne: Colors.buttonRight, colorTwo: Colors.buttonLeft)
        signUp.setGradientBackground(colorOne: Colors.buttonRight, colorTwo: Colors.buttonLeft)
        
        
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
extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.cornerRadius = self.frame.height/2
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
