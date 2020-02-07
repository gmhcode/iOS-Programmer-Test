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
     * 11) Make the UI look like it does in the mock-up.
     *
     * 12) Take username and password input from the user using UITextFields
     *
     * 13) Make sure that the email is a valid email. In the sense that it has a @ and a .com, .edu, etc. Added some common password requirements and document what they are.
     *
     * 14) Simulate a successful login by displaying an alert
     *
     * 1 5) In the alert give the option to press "ok" which would return the user to the main screen
     **/
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
    }
    
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
           
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        
        let isValidEm = isValidEmail(emailTextField.text ?? "")
        let isValidPW = isValidPassword(passwordTextField.text ?? "")
        
        if isValidEm == true && isValidPW == true {
            print("true")
        }else if isValidPW {
            print("false")
        }
    }
    
    
    
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //requirements for password is at least 1 uppercase, 1 lowercase, 1 non letter, at least 5 characters long and no spaces
    func isValidPassword(_ pw: String) -> Bool {
        
        dismissKeyboards()
        
        if pw.contains(where: {$0.isUppercase == true })
            && pw.contains(where: {$0.isLowercase == true})
            && pw.contains(where: {$0.isLetter == false})
            && pw.count >= 5
            && !pw.contains(where: {$0 == " "}){
                successfulAlert()
                return true
        }
        return false
    }
    
    func dismissKeyboards() {
        
        if passwordTextField.isFirstResponder == true {
            passwordTextField.resignFirstResponder()
        }
        if emailTextField.isFirstResponder == true {
            emailTextField.resignFirstResponder()
        }
        
    }
    
    
    func successfulAlert() {
        
        let alertController = UIAlertController(title: "Success", message: "You Have Logged In!", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (ok) in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alertController, animated: true, completion: nil)
        
    }
}
