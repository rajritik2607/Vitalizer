//
//  CovidQuestion.swift
//  vitalizer
//
//  Created by Ritik Suryawanshi on 11/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import Foundation

class CovidQuestion {
    
     var list = [CovidBrain]()
            
            init()
            {
                // Creating a quiz item and appending it to the list
                let item = CovidBrain(text: " 1. What is your gender?")
                
                // Add the Question to the list of questions
                list.append(item)
                
                // skipping one step and just creating the quiz item inside the append function
                
                list.append(CovidBrain(text: "2. Were you recently admitted in hospital?"))
                
                list.append(CovidBrain(text: "3. Have you ever had pneumonia?"))
                
                list.append(CovidBrain(text: "4. What is your age?"))
                
                list.append(CovidBrain(text: "5. Have you ever had diabetes?"))
                
                list.append(CovidBrain(text: "6. Have you experienced any Chronic Obstructive Pulmonary Disease?"))
                
                list.append(CovidBrain(text: "7. Have you ever had Asthma?"))

                list.append(CovidBrain(text: "8. Have you had any major operations in the past?"))
                
                list.append(CovidBrain(text: "9. Do you experience hypertension?"))
                
                list.append(CovidBrain(text: "10. Have you had any other major disease in the past?"))
                
                list.append(CovidBrain(text: "11. Have you had any heart disease in the past?"))
                
                list.append(CovidBrain(text: "12. Are you obese?"))
                
                list.append(CovidBrain(text: "13. Have you had any disease related to kidney in the past?"))
                
                 list.append(CovidBrain(text: "14. Do you consume any tobacco products?"))
                
               
     
    }
}
