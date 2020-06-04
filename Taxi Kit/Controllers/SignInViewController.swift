//
//  SignInViewController.swift
//  Taxi Kit
//
//  Created by Sergey Borisov on 04.06.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var visibleImage: UIImageView!
    
    var passwordIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.layer.cornerRadius = 20

        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func visibleButtonPressed(_ sender: UIButton) {
        
        if passwordIsHidden {
            if let image = UIImage(named: "visible") {
                visibleImage.image = image
            }
        } else {
            if let image = UIImage(named: "hidden") {
                visibleImage.image = image
            }
        }
        
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        passwordIsHidden = !passwordIsHidden
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}
