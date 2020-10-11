//
//  ProfileViewController.swift
//  vitalizer
//
//  Created by riddhi gupta on 10/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var choosegender: UIPickerView!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var bloodGroup: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var age: UITextField!
    var list = ["Male","Female","Trans","Queer","Prefer not to answer"]
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        signUp.applyDesign()
        signUp.setGradientBackground(colorOne: Colors.buttonRight, colorTwo: Colors.buttonLeft)
        view.setGradientBackground(colorOne: Colors.bottomRight, colorTwo: Colors.topLeft)
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }

    func pickerView(pickerView: UIPickerView,numberOfRowsInComponent component :Int) -> Int{
        return list.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row:Int, forComponent :Int)->String! {
        self.view.endEditing(true)
        return list[row]
    }
    
    func pickerView(pickerView: UIPickerView,didSelectRow row:Int, inComponent component:Int) {
        self.gender.text = self.list[row]
        self.choosegender.isHidden = true
    }
    func textFieldDidBeginEditing(textField: UITextField){
        if textField == self.gender{
            self.choosegender.isHidden = false
            textField.endEditing(true)
        }
    }
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
        guard let nameText = self.Name.text, !nameText.isEmpty else { return}
        guard let genderText = self.gender.text, !genderText.isEmpty else { return}
           guard let bloodgroupText = self.bloodGroup.text, !bloodgroupText.isEmpty else { return}
        
           guard let phoneText = self.phoneNo.text, !phoneText.isEmpty else { return}
                   
           guard let weightText = self.weight.text, !weightText.isEmpty else { return}
           guard let heightText = self.height.text, !heightText.isEmpty else { return}
        guard let ageText = self.age.text, !ageText.isEmpty else { return}
        let values = ["name": nameText,"gender": genderText, "bloodgroup": bloodgroupText, "phoneNo": phoneText,"weight": weightText, "height": heightText,"age": ageText]
        Database.database().reference().child("users").child("\(Auth.auth().currentUser!.uid)").updateChildValues(values) {
          (error:Error?, ref:DatabaseReference) in
          
            if let error = error {
            print("Data could not be saved: \(error).")
          } else {
            print("Data saved successfully!")
          }
        }
        self.performSegue(withIdentifier: "signuptotab", sender: nil)
    }
    
}
