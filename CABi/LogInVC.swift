//
//  ViewController.swift
//  CABi
//
//  Created by C4Q on 6/7/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    
//    @IBOutlet weak var messageDisplayLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        
        FirebaseAPIClient.manager.login(with: userNameTextField.text!, and: passwordTextField.text!) { (user, error) in
            guard error == nil else { return }
            guard let _ = user else {print("no user"); return }
            self.performSegue(withIdentifier: "signInSegue", sender: UIButton.self)
        }
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        if let emailTextField = userNameTextField.text, let passwordTextField = passwordTextField.text {
            Auth.auth().createUser(withEmail: emailTextField, password: passwordTextField){ (user, error) in
                guard error == nil else { return }
                guard let _ = user else {print("no user"); return }
                self.performSegue(withIdentifier: "signUpSegue", sender: UIButton.self)
            }
        }
    }
    
}

