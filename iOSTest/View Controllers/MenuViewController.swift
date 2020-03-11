//
//  MenuViewController.swift
//  iOSTest
//
//  Created by HannDev LLC on 9/9/19.
//  Copyright © 2019 HannDev LLC. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     *
     * 1 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
     *
     * 1 2) Use Autolayout to make sure all UI works for each resolution
     *
     * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
     *    provided code if necessary. It is ok to add any classes. This is your project now!
     *
     * 4) Read the additional instructions comments throughout the codebase, they will guide you.
     *
     * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
     *
     * Thank you and Good luck. - HannDev, LLC
     * =========================================================================================
     */
    
    // MARK: - Outlets
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var chatButtonView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var animationButton: UIButton!
    @IBOutlet weak var animationView: UIView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatButtonView.layer.cornerRadius = 5
        loginView.layer.cornerRadius = 5
        animationView.layer.cornerRadius = 5
        
        
        // initial load of messages and images, I used this to cache them before we get to the chat file so there is no delay
        ChatClient.fetchChatData({ (messages) in
            guard let messages = messages else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}

            for message in messages {
                MessageController.fetchImage(message: message) { (image) in
                    
                }
            }
        }) { (error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.description) : \(#file) \(#line)")
                return
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func didPressChatButton(_ sender: Any) {
        
        let chatViewController = ChatViewController()
        chatButtonView.pulsate()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        let loginViewController = LoginViewController()
        loginView.pulsate()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func didPressAnimationButton(_ sender: Any) {
        let animationViewController = AnimationViewController()
        animationView.pulsate()
        navigationController?.pushViewController(animationViewController, animated: true)
    }
}

