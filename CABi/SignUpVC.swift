//
//  SignUpVC.swift
//  CABi
//
//  Created by C4Q on 6/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    var ref: DatabaseReference?
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var dOBTextField: UITextField!
    @IBOutlet weak var licenseNumberTextField: UITextField!
    @IBOutlet weak var hackNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

    }

    @IBAction func registerButtonPressed(_ sender: Any) {
        let driverTask = Task(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, dateOfBirth: dOBTextField.text!, licenseNumber: licenseNumberTextField.text!, hackLicense: hackNumberTextField.text!)
        if let userName = userNameTextField.text, let password = passwordTextField.text {
            FirebaseAPIClient.manager.createTasks(task: driverTask, userEmail: userName)
            FirebaseAPIClient.manager.createAccount(with: userName, and: password, completion: { (user, error) in
                guard error == nil else {return}
                guard let _ = user else {print("no user"); return }
                self.performSegue(withIdentifier: "signUpSegue", sender:  UIButton.self)
            })
        }
        
        
    }
    

}
