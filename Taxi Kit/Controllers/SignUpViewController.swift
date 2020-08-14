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
    
    //Variable for detecting if password text is hidden or not.
    private var passwordIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 20
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        //Hide navigation bar.
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        //Hide keyboard when tap outside textfield
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Switch to VerifyCodeViewController.
    @IBAction func singUpButtonPressed(_ sender: UIButton) {
        
        clearTextFields()
        
        let storyboard = UIStoryboard(name: "VerifyCode", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "VerifyCodeVC") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
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
    
    //Create SignInViewController when sign in button is pressed.
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        
        clearTextFields()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignInVC") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    //Auxillary function for hide keyboard when tap outside textfield.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //Clear textfields when move from SignUpViewController.
    private func clearTextFields() {
        
        nameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
    }
}

//MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {

    //Dismiiss keyboard when return button is pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
