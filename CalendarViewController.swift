//
//  CalendarViewController.swift
//  vitalizer
//
//  Created by riddhi gupta on 11/10/20.
//  Copyright © 2020 riddhi gupta. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate {

    
    @IBOutlet weak var secondDot: UIImageView!
    @IBOutlet weak var presentDate: UILabel!
    @IBOutlet var calendar : FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        let imageIcon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        secondDot.image = imageIcon
        view.setGradientBackground(colorOne: Colors.bottomRight, colorTwo: Colors.topLeft)
        
        
    }
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = " dd MMMM YYYY"
        let string = formatter.string(from: date)
        presentDate.text = string
        
    }

  

}
