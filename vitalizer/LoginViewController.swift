//
//  LoginViewController.swift
//  vitalizer
//
//  Created by riddhi gupta on 10/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        login.applyDesign()
        login.setGradientBackground(colorOne: Colors.buttonRight, colorTwo: Colors.buttonLeft)
        view.setGradientBackground(colorOne: Colors.bottomRight, colorTwo: Colors.topLeft)
        

}
    
    @IBAction func loginPressed(_ sender: UIButton) {
   Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
           if error == nil{
                
               self.performSegue(withIdentifier: "logintotab", sender: nil)
           }
           else{
               let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
               let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
               
               alertController.addAction(defaultAction)
               self.present(alertController, animated: true, completion: nil)
           
           

   }

   
    }
    

}
}

