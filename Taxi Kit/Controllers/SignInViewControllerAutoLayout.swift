//
//  SignInViewControllerAutoLayout.swift
//  Taxi Kit
//
//  Created by Sergey Borisov on 26.06.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class SignInViewControllerAutoLayout: UIViewController {
    
    // Create a label "Sign in".
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sing in"
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Bold", size: 20)
        label.textColor = UIColor(named: "Black")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // Setup some constraints for signInLabel.
    fileprivate func setupSignInLabel() {
        view.addSubview(signInLabel)
        
        // Add some anchors to signInLabel.
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signInLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    // Create a label "EMAIL".
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "EMAIL"
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Bold", size: 13)
        label.textColor = UIColor(named: "Black")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // Create a textField for emailLabel.
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.backgroundColor = UIColor(named: "Grey 3")
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor(named: "Grey")?.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // Setup some constraints for EMAIL parameter.
    fileprivate func setupEmailStackView() {
        
        addPaddingView(to: emailTextField)
        
        // Make a vertical stack for EMAIL parameter.
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.axis = .vertical
        emailStackView.spacing = 7
        
        view.addSubview(emailStackView)
        
        NSLayoutConstraint.activate([
            emailLabel.heightAnchor.constraint(equalToConstant: 20),
            emailLabel.widthAnchor.constraint(equalToConstant: 303),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            emailTextField.widthAnchor.constraint(equalToConstant: 303),
            
            emailStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -162.5),
            emailStackView.heightAnchor.constraint(equalToConstant: 71),
            emailStackView.widthAnchor.constraint(equalToConstant: 303)
        ])
    }
    
    // Create a label "PASSWORD".
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "PASSWORD"
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Bold", size: 13)
        label.textColor = UIColor(named: "Black")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // Create a textField for passwordLabel.
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.backgroundColor = UIColor(named: "Grey 3")
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor(named: "Grey")?.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: textField.frame.height))
        textField.rightView = paddingView
        textField.rightViewMode = .always
        
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    // This function gives an indent from left side of your textField.
    private func addPaddingView(to textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    // Create a button "visibilityButton".
    private let visibilityButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.setImage(UIImage(named: "hidden"), for: .normal)
        button.tintColor = UIColor(named: "Grey 2")
        
        button.addTarget(self, action: #selector(visibilityButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    // Variable for detecting if password text is hidden or not.
    private var passwordIsHidden = true
    
    // Make password text visible and hidden when visibility button is pressed.
    @objc private func visibilityButtonPressed() {
        
        if passwordIsHidden {
            if let image = UIImage(named: "visible") {
                visibilityButton.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(named: "hidden") {
                visibilityButton.setImage(image, for: .normal)
            }
        }
        
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        passwordIsHidden = !passwordIsHidden
    }
    
    // This function gives an ability to switch between visible and invisible text in textField.
    private func addVisibilityButton(to textField: UITextField) {
        textField.addSubview(visibilityButton)
        
        NSLayoutConstraint.activate([
            visibilityButton.topAnchor.constraint(equalTo: textField.topAnchor, constant: 16.5),
            visibilityButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: -18)
        ])
    }
    
    // Setup some constraints for PASSWORD parameter.
    fileprivate func setupPasswordStackView() {
        
        addPaddingView(to: passwordTextField)
        addVisibilityButton(to: passwordTextField)
        
        // Make a vertical stack for PASSWORD parameter.
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField])
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordStackView.axis = .vertical
        passwordStackView.spacing = 7
        
        view.addSubview(passwordStackView)
        
        NSLayoutConstraint.activate([
            passwordLabel.heightAnchor.constraint(equalToConstant: 20),
            passwordLabel.widthAnchor.constraint(equalToConstant: 303),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.widthAnchor.constraint(equalToConstant: 303),
            
            passwordStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -65.5),
            passwordStackView.heightAnchor.constraint(equalToConstant: 71),
            passwordStackView.widthAnchor.constraint(equalToConstant: 303)
        ])
    }
    
    // Create a button "Sign In".
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 18)
        button.setTitle("Sign In", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor(named: "Deep Blue")
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // Setup some constraints for Sign In button.
    fileprivate func setupSignInButton() {
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            signInButton.heightAnchor.constraint(equalToConstant: 60),
            signInButton.widthAnchor.constraint(equalToConstant: 303),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40)
        ])
    }
    
    //Create an imageView with image "Line".
    private let leftLineImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Line"))
        imageView.contentMode = .center
        
        return imageView
    }()
    
    //Create an imageView with image "Line".
    private let rightLineImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Line"))
        imageView.contentMode = .center
        
        return imageView
    }()
    
    //Create a label "OR SIGN IN WITH".
    private let signInWithSocialNetLabel: UILabel = {
        let label = UILabel()
        label.text = "OR SIGN IN WITH"
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Bold", size: 13)
        label.textColor = UIColor(named: "Black")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 20),
            label.widthAnchor.constraint(equalToConstant: 131)
        ])
        
        return label
    }()
    
    // Setup some constraints for signInWithSocialNetStackView.
    fileprivate func setupSignInWithSocialNetLabel() {
        let signInWithSocialNetStackView = UIStackView(arrangedSubviews: [leftLineImageView, signInWithSocialNetLabel, rightLineImageView])
        signInWithSocialNetStackView.translatesAutoresizingMaskIntoConstraints = false
        signInWithSocialNetStackView.axis = .horizontal
        signInWithSocialNetStackView.spacing = 0
        
        view.addSubview(signInWithSocialNetStackView)
        
        NSLayoutConstraint.activate([
            signInWithSocialNetStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInWithSocialNetStackView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 50)
        ])
    }
    
    //Create a button "facebookButton".
    private let facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let image = UIImage(named: "ic_facebook")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: "Grey")
        
        return button
    }()
    
    //Create a button "twitterButton".
    private let twitterButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let image = UIImage(named: "ic_twitter")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: "Grey")
        
        return button
    }()
    
    //Create a button "gmailButton".
    private let gmailButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let image = UIImage(named: "ic_gmail")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: "Grey")
        
        return button
    }()
    
    // Setup some constraints for socialNetStackView.
    fileprivate func setupSocialNetStackView() {
        let socialNetStackView = UIStackView(arrangedSubviews: [facebookButton, twitterButton, gmailButton])
        socialNetStackView.translatesAutoresizingMaskIntoConstraints = false
        socialNetStackView.axis = .horizontal
        socialNetStackView.spacing = 30
        
        view.addSubview(socialNetStackView)
        
        NSLayoutConstraint.activate([
            socialNetStackView.heightAnchor.constraint(equalToConstant: 50),
            socialNetStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            socialNetStackView.topAnchor.constraint(equalTo: signInWithSocialNetLabel.bottomAnchor, constant: 30)
        ])
    }
    
    // Create a label for ability to switch to Sign Up screen.
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.textColor = UIColor(named: "Grey 2")
        label.font = UIFont(name: "Inter-Regular", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // Create a button to "Sign Up" screen.
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        
        guard let interFont = UIFont(name: "Inter-Regular", size: 15) else {
            fatalError("Failed to load the 'Inter-Regular' font.")
        }
        guard let titleColor = UIColor(named: "Deep Blue") else {
            fatalError("Failed to set the 'Deep blue' color.")
        }
        let buttonAttributes: [NSAttributedString.Key: Any] = [
            .font: interFont,
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: titleColor
        ]
        let attributedString = NSMutableAttributedString(string: "Sign up", attributes: buttonAttributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(switchToSignUpViewController), for: .touchUpInside)
        
        return button
    }()
    
    // Function to dismiss Sign In screen and to move to Sign Up screen.
    @objc private func switchToSignUpViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Setup some constraints for stack that allows to switch to Sign up screen.
    fileprivate func setupBottomStackView() {
        let bottomStackView = UIStackView(arrangedSubviews: [bottomLabel, signUpButton])
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 10
        bottomStackView.distribution = .equalSpacing
        
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            bottomStackView.heightAnchor.constraint(equalToConstant: 21),
            bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //Auxillary function for hide keyboard when tap outside textfield.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupSignInLabel()
        setupEmailStackView()
        setupPasswordStackView()
        setupSignInButton()
        setupSignInWithSocialNetLabel()
        setupSocialNetStackView()
        setupBottomStackView()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        view.backgroundColor = .white
        
        //Hide keyboard when tap outside textfield
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
}

//MARK: - UITextFieldDelegate
extension SignInViewControllerAutoLayout: UITextFieldDelegate {

    //Dismiiss keyboard when return button is pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
