//
//  dashboardViewController.swift
//  transitions mental health assoc
//
//  Created by Finlay Piroth on 4/7/20.
//  Copyright © 2020 Hack4Impact. All rights reserved.
//

import UIKit

class dashboardViewController: UIViewController {
    
    //MARK: properties

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: functions
    @objc func dismissKeyboard (){
        view.endEditing(true)
    }
}
