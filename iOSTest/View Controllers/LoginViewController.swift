//
//  LoginViewController.swift
//  iOSTest
//
//  Created by HannDev LLC on 9/9/19.
//  Copyright © 2019 HannDev LLC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take username and password input from the user using UITextFields
     *
     * 3) Make sure that the email is a valid email. In the sense that it has a @ and a .com, .edu, etc. Added some common password requirements and document what they are.
     *
     * 4) Simulate a successful login by displaying an alert
     *
     * 5) In the alert give the option to press "ok" which would return the user to the main screen
     **/
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        
                
        self.navigationController?.popViewController(animated: true)
        
        //vv this was adding more view controllers to the stack.. which is not good
//        let mainMenuViewController = MenuViewController()
//        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
    }
}
