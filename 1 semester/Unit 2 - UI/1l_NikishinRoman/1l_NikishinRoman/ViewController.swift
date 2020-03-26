//
//  ViewController.swift
//  1l_NikishinRoman
//
//  Created by Admin on 13.03.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var userPasswordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    @IBAction func loginPressed() {
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        
        if login == "root" && password == "toor" {
            print("Успешная авторизация")
        } else {
            print("Неуспешная авторизация")
        }
    }
   
            
    @objc func keyboardWasShown(notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo as! [String: Any]
        let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        scrollBottomConstraint.constant = frame.height
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        scrollBottomConstraint.constant = 0
    }
}
