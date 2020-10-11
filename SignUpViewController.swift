//
//  SignUpViewController.swift
//  vitalizer
//
//  Created by riddhi gupta on 10/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    
    var ref : DatabaseReference!


 
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        signUp.applyDesign()
        signUp.setGradientBackground(colorOne: Colors.buttonRight, colorTwo: Colors.buttonLeft)
        view.setGradientBackground(colorOne: Colors.bottomRight, colorTwo: Colors.topLeft)
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        if password.text != confirmPass.text {
                          let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
                          let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                          
                          alertController.addAction(defaultAction)
                          self.present(alertController, animated: true, completion: nil)
                      
        }
        else{
            
       signIn()
        }
    }
    
    func signIn() {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            if error == nil {
                guard let emailText = self.email.text, !emailText.isEmpty else { return}
                guard let passwordText = self.password.text, !passwordText.isEmpty else { return}
                let values = ["email": emailText, "password": passwordText]
             Database.database().reference().child("users").child("\(Auth.auth().currentUser!.uid)").updateChildValues(values) {
              (error:Error?, ref:DatabaseReference) in
              
                if let error = error {
                print("Data could not be saved: \(error).")
              } else {
                print("Data saved successfully!")
              }
            }
            self.performSegue(withIdentifier: "signuptoprofile", sender: self)
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
