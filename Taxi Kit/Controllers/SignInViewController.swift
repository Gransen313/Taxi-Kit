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
    
    //Variable for detecting if password text is hidden or not.
    private var passwordIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.layer.cornerRadius = 20
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        //Hide navigation bar.
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        //Hide keyboard when tap outside textfield
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    //Make password text visible and hidden when visible button is pressed
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
    
    //Dismiss SignInViewController when sign up button is pressed.
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    //Auxillary function for hide keyboard when tap outside textfield.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate
extension SignInViewController: UITextFieldDelegate {

    //Dismiiss keyboard when return button is pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
