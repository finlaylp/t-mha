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
    
    @IBOutlet weak var eventComments: UITextField!
    @IBOutlet weak var eventTime: UITextField!
    @IBOutlet weak var eventDate: UITextField!
    @IBOutlet weak var eventType: UISegmentedControl!
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
        selector: #selector(self.keyboardNotification(notification:)),
        name: UIResponder.keyboardWillChangeFrameNotification,
        object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    //MARK: functions
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let curEvent = Event.init(type: eventType.titleForSegment(at: eventType.selectedSegmentIndex), date: eventDate.text, time: eventTime.text, comments: eventComments.text)
    }
    
    @objc func dismissKeyboard (){
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let endFrameY = endFrame?.origin.y ?? 0
            let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
            if endFrameY >= UIScreen.main.bounds.size.height {
                self.keyboardHeightLayoutConstraint?.constant = 0.0
            } else {
                self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                                       delay: TimeInterval(0),
                                       options: animationCurve,
                                       animations: { self.view.layoutIfNeeded() },
                                       completion: nil)
        }
    }
    
    struct Event {
        var type: String?
        var date: String?
        var time: String?
        var comments: String?
    }
}
