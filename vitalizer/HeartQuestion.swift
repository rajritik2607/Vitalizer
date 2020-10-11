//
//  HeartQuestion.swift
//  vitalizer
//
//  Created by Ritik Suryawanshi on 11/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import Foundation

class HeartQuestion {
    
     var list = [HeartBrain]()
            
            init()
            {
                // Creating a quiz item and appending it to the list
                let item = HeartBrain(text: " 1. What is your gender?")
                
                // Add the Question to the list of questions
                list.append(item)
                
                // skipping one step and just creating the quiz item inside the append function
                
                list.append(HeartBrain(text: "2. What is your age?"))
                
                list.append(HeartBrain(text: "3. Do you smoke or not"))
                
                list.append(HeartBrain(text: "4. If yes, then how many ?"))
                
                list.append(HeartBrain(text: "5. Do you take BP medicines"))
                
                list.append(HeartBrain(text: "6. Do you often get stroke?"))
                
                list.append(HeartBrain(text: "7. Do you experience hypertension?"))

                list.append(HeartBrain(text: "8. Are you diabetic?"))
                
                list.append(HeartBrain(text: "9. Total cholestrol?"))
                
                list.append(HeartBrain(text: "10. Systolic BP?"))
                
                list.append(HeartBrain(text: "11. Diastolic BP?"))
                
                list.append(HeartBrain(text: "12. What is your BMI?"))
                
                list.append(HeartBrain(text: "13. What is your heart rate?"))
                
                 list.append(HeartBrain(text: "14. What is your glucose level?"))
                
               
     
    }
}
