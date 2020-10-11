//
//  HeartFinalViewController.swift
//  vitalizer
//
//  Created by Ritik Suryawanshi on 11/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class HeartFinalViewController: UIViewController {

    @IBOutlet weak var advice: UILabel!
    @IBOutlet weak var chance: UILabel!
    
    @IBOutlet weak var heartprob: UILabel!
    
    var ref : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let uid = Auth.auth().currentUser?.uid else
            {
                return
            }
            ref = Database.database().reference()
            let userReference = ref.child("users").child(uid)
            
            userReference.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject]
             {
                        let probText = dictionary["heartprob"] as! String
                        
                self.heartprob.text = probText
                
                var x = Float(probText)
                if( x! < 30)
                {
                    self.chance.text = "LOW CHANCES OF YOU INFECTING WITH A HEART DISEASE"
                    self.advice.text = "TRY HOME QUARANTINE"
                }
                else if (x! > 30 && x!<60)
                {
                    self.chance.text = "MEDIUM CHANCES OF YOU INFECTING WITH A HEART DISEASE"
                    self.advice.text = "MIGHT WANT TO CONSULT A DOCTOR"
                }
                else if (x! > 60)
                {
                    self.chance.text = "HIGH CHANCES OF YOU INFECTING WITH A HEART DISEASE"
                    self.advice.text = "SHOULD GET ADMITTED RIGHT AWAY"
                }
                }
                })

            // Do any additional setup after loading the view.
        }
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
