//
//  ViewController.swift
//  Taxi Kit
//
//  Created by Sergey Borisov on 03.06.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var visibleImage: UIImageView!
    
    private var passwordIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 20
        
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
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "signUpToSignIn", sender: sender)
    }
}

