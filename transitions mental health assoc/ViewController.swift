//
//  ViewController.swift
//  transitions mental health assoc
//
//  Created by Finlay Piroth on 1/7/20.
//  Copyright © 2020 Hack4Impact. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //must scrape data from website to input into the table cells
    //CELLS -> text info, image
    //give buttons functionality
    
    //MARK: properties
    @IBOutlet weak var dashboardButton: UIButton!
    @IBOutlet weak var messagesButton: UIButton!
    @IBOutlet weak var patientDataButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButton(button: dashboardButton)
        setButton(button: messagesButton)
        setButton(button: patientDataButton)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard (){
        view.endEditing(true)
    }
    
    func setButton(button: UIButton){
        let imgsize = button.imageView!.frame.size
        let titlesize = button.titleLabel!.frame.size
        let totalHeight = imgsize.height + titlesize.height

        button.imageEdgeInsets = UIEdgeInsets(top: -(totalHeight - imgsize.height), left: 42.5 - (imgsize.width/2), bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imgsize.width, bottom: -(totalHeight - titlesize.height), right: 0)
    }
}

class Appointment {
    var type: String
    var priority: String
    var date: String
    var time: String
    
    init(type: String, priority: String, date: String, time: String) {
        self.type = type
        self.priority = priority
        self.date = date
        self.time = time
    }
    
}

