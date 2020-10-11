//
//  ReportViewController.swift
//  vitalizer
//
//  Created by riddhi gupta on 10/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ReportViewController: UIViewController {

    var ref : DatabaseReference!
    
    @IBOutlet weak var heartprob: UILabel!
    @IBOutlet weak var covprob: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Age: UILabel!
    @IBOutlet weak var person: UIImageView!
    @IBOutlet weak var emailId: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var Sex: UILabel!
    @IBOutlet weak var Weight: UILabel!
    @IBOutlet weak var Height: UILabel!
    @IBOutlet weak var Bmi: UILabel!
    @IBOutlet weak var BloodGroup: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var pill: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
view.setGradientBackground(colorOne: Colors.bottomRight, colorTwo: Colors.topLeft)
       
        let imageIconn = UIImage(systemName: "person.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        person.image = imageIconn
        let imageIconnn = UIImage(systemName: "phone.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        contactImage.image = imageIconnn
        
        guard let uid = Auth.auth().currentUser?.uid else
        {
            return
        }
         ref = Database.database().reference()
        let userReference = ref.child("users").child(uid)
        
        userReference.observeSingleEvent(of: .value, with: { (snapshot) in
        
        if let dictionary = snapshot.value as? [String: AnyObject]
         {
                    let nameText = dictionary["name"] as! String
                    let emailText = dictionary["email"] as! String
                    let phoneText = dictionary["phoneNo"] as! String
                    let weightText = dictionary["weight"] as! String
                    let heightText = dictionary["height"] as! String
                    let genderText = dictionary["gender"] as! String
                    let bloodgroupText = dictionary["bloodgroup"] as! String
                    let ageText = dictionary["age"] as! String
                     let covtext = dictionary["covidprob"] as! String
            
                    let hearttext = dictionary["heartprob"] as! String
                                
            var bmical : Float
            
            var heightreal : Float = Float(heightText)!/100
            var weightreal : Float = Float(weightText)!
            bmical = weightreal / (heightreal * heightreal)
        
        self.name.text = nameText
        self.emailId.text = emailText
        self.phoneNo.text = phoneText
        self.Weight.text = weightText
        self.Height.text = heightText
        self.BloodGroup.text = bloodgroupText
        self.Age.text = ageText
        self.Sex.text = genderText
            self.Bmi.text = String(bmical)
            self.covprob.text = covtext
            self.heartprob.text = hearttext
            
        }
        })
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
