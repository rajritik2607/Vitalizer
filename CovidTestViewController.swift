//
//  CovidTestViewController.swift
//  vitalizer
//
//  Created by Ritik Suryawanshi on 11/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import CoreML

class CovidTestViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesbutton: UIButton!
    @IBOutlet weak var nobutton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var Done: UIButton!
    
    var model =  final_covid_model()
    let allQuestions = CovidQuestion()
    var pickedAnswer : Int = 0
    var questionNumber : Int = 0
    var arr = [Int]()
    var ref : DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Done.isHidden = true
        nobutton.layer.borderWidth = 2
         nobutton.layer.borderColor = UIColor.black.cgColor
         nobutton.layer.cornerRadius = 25.0
         nobutton.tintColor = UIColor.black
         yesbutton.layer.borderWidth = 2
         yesbutton.layer.borderColor = UIColor.black.cgColor
         yesbutton.layer.cornerRadius = 25.0
         yesbutton.tintColor = UIColor.black
         exitButton.layer.borderWidth = 2
         exitButton.layer.borderColor = UIColor.black.cgColor
         exitButton.layer.cornerRadius = 25.0
         exitButton.tintColor = UIColor.black
         
         Done.layer.borderWidth = 2
         Done.layer.borderColor = UIColor.black.cgColor
         Done.layer.cornerRadius = 25.0
         Done.tintColor = UIColor.black
        guard let uid = Auth.auth().currentUser?.uid else
        {
            return
        }
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        ref = Database.database().reference()
        let userReference = ref.child("users").child(uid)
        
        userReference.observeSingleEvent(of: .value, with: { (snapshot) in
        
        if let dictionary = snapshot.value as? [String: AnyObject]
         {
         let genderText = dictionary["gender"] as! String
            if genderText == "Male"
            {
            self.arr.append(1)
            self.questionNumber+=1
            self.nextQuestion()
            }
            else{
                self.arr.append(0)
                self.questionNumber+=1
                self.nextQuestion()
            }
            }
        }
            )
            
            }

        // Do any additional setup after loading the view
    
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        
        arr.append(1)
        questionNumber+=1
        nextQuestion()
    }
    
    @IBAction func noButtonPressed(_ sender: UIButton) {
        
        arr.append(0)
        questionNumber+=1
        nextQuestion()
    }
    
    func nextQuestion() {
    
        
    if questionNumber < 14
    {
        
        if questionNumber == 3
        {
           
            questionLabel.text=allQuestions.list[questionNumber].questionText
            guard let uid = Auth.auth().currentUser?.uid else
            {
                return
            }
             ref = Database.database().reference()
            let userReference = ref.child("users").child(uid)
            
            userReference.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject]
             {
             let ageText = dictionary["age"] as! String
                self.arr.append(Int(ageText)!)
                self.questionNumber+=1
                self.nextQuestion()
                }
                })
        }
        else{
            
            
    questionLabel.text=allQuestions.list[questionNumber].questionText
        }
    }
        
    else
    {
        
        print(arr)
       mlModel()
        Done.isHidden = false
        
        //performSegue(withIdentifier: "covidtoresult", sender: nil)
        }}
    
    func mlModel()
    {
        do{
            var muArray = try? MLMultiArray(shape: [1,14], dataType: MLMultiArrayDataType.float32)
              
                muArray = convertToMLArray(arr)
               let res =  try model.prediction(dense_104_input: muArray! )
                print(res.classLabel)
                print(res.Identity["covid_res"])
            var abc = res.Identity["covid_res"]! * 100
            var str = String(abc)
            let values = ["covidprob": str]
            Database.database().reference().child("users").child("\(Auth.auth().currentUser!.uid)").updateChildValues(values) {
              (error:Error?, ref:DatabaseReference) in
              
                if let error = error {
                print("Data could not be saved: \(error).")
              } else {
                print("Data saved successfully!")
              }
            }
            print(abc)
            
            }
            catch {
                print("got exception")
            }
        }
        
        func convertToMLArray(_ input: [Int]) -> MLMultiArray {

            let mlArray = try? MLMultiArray(shape: [1,14], dataType: MLMultiArrayDataType.float32)


            for i in 0...13 {
                mlArray?[i] = NSNumber(value: input[i])
            }


            return mlArray!
            
            
        }

}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


