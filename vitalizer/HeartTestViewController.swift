//
//  HeartTestViewController.swift
//  vitalizer
//
//  Created by Ritik Suryawanshi on 11/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
import CoreML
import Firebase
import FirebaseDatabase

class HeartTestViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var yesbutton: UIButton!
    
    @IBOutlet weak var nobutton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var Done: UIButton!
    @IBOutlet weak var answer: UITextField!
    
    
    var model =  final_heart_model()
    let allQuestions = HeartQuestion()
    var pickedAnswer : Int = 0
    var questionNumber : Int = 0
    var arr = [Int]()
    var ref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answer.isHidden = true

        // Do any additional setup after loading the view.
    }
    @IBAction func yesButtonPressed(_ sender: UIButton) {
        arr.append(1)
    }
    
    @IBAction func noButtonPressed(_ sender: UIButton) {
        arr.append(0)
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        questionNumber+=1
        nextQuestion()
    }
    
    func nextQuestion() {
    
        
    if questionNumber < 14
    {
        
        /*if questionNumber == 0 || questionNumber == 1
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
                self.arr.append(Int(ageText)!)
                self.questionNumber+=1
                self.nextQuestion()
                }
                })
        }*/
        /*if questionNumber == 3
        {
            answer.isHidden = false
            var bcd = Int(answer.text!)
            arr.append(bcd!)
        }
            if questionNumber > 7
            {
                answer.isHidden = false
                var bcd = Int(answer.text!)
                arr.append(bcd!)
            }
            */
        
            
            answer.isHidden = true
    questionLabel.text=allQuestions.list[questionNumber].questionText
        
    }
        
    else
    {
        
        print(arr)
       
        Done.isHidden = false
        
        //performSegue(withIdentifier: "covidtoresult", sender: nil)
        }}
    
    func mlModel()
    {
        do{
            var muArray = try? MLMultiArray(shape: [1,14], dataType: MLMultiArrayDataType.float32)
              
                muArray = convertToMLArray(arr)
               let res =  try model.prediction(dense_7_input: muArray! )
                print(res.classLabel)
                print(res.Identity["TenYearCHD"])
            var abc = res.Identity["TenYearCHD"]! * 100
            var str = String(abc)
            let values = ["heartprob": str]
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
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
