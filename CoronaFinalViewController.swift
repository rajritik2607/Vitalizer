//
//  CoronaFinalViewController.swift
//  vitalizer
//
//  Created by Ritik Suryawanshi on 11/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CoronaFinalViewController: UIViewController {

    var ref : DatabaseReference!
    @IBOutlet weak var covprob: UILabel!
    
    @IBOutlet weak var chance: UILabel!
    
    @IBOutlet weak var advice: UILabel!
    
    @IBOutlet var Done: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Done.layer.borderWidth = 2
        Done.layer.borderColor = UIColor.black.cgColor
        Done.layer.cornerRadius = 25.0
        Done.tintColor = UIColor.black
        guard let uid = Auth.auth().currentUser?.uid else
        {
            return
        }
         ref = Database.database().reference()
        let userReference = ref.child("users").child(uid)
        
        userReference.observeSingleEvent(of: .value, with: { (snapshot) in
        
        if let dictionary = snapshot.value as? [String: AnyObject]
         {
                    let probText = dictionary["covidprob"] as! String
                    
            self.covprob.text = probText
            
            var x = Float(probText)
            if( x! < 30)
            {
                self.chance.text = "LOW CHANCES OF YOU INFECTING WITH COVID-19"
                self.advice.text = "TRY HOME QUARANTINE"
            }
            else if (x! > 30 && x!<60)
            {
                self.chance.text = "MEDIUM CHANCES OF YOU INFECTING WITH COVID-19"
                self.advice.text = "MIGHT WANT TO CONSULT A DOCTOR"
            }
            else if (x! > 60)
            {
                self.chance.text = "HIGH CHANCES OF YOU INFECTING WITH COVID-19"
                self.advice.text = "SHOULD GET ADMITTED RIGHT AWAY"
            }
            }
            })

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
