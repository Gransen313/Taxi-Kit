//
//  SignUpViewControllerAutoLayout.swift
//  Taxi Kit
//
//  Created by Sergey Borisov on 25.06.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class SignUpViewControllerAutoLayout: UIViewController {
    
    // Create a label "Sign up".
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sing up"
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Bold", size: 20)
        label.textColor = UIColor(named: "Black")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // Setup some constraints for signUpLabel.
    fileprivate func setupSignUpLabel() {
        view.addSubview(signUpLabel)
        
        // Add some anchors to signUpLabel.
        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signUpLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    // Create a label "NAME".
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "NAME"
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Bold", size: 13)
        label.textColor = UIColor(named: "Black")
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // Create a textField for nameLabel.
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.backgroundColor = UIColor(named: "Grey 3")
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor(named: "Grey")?.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // Setup some constraints for NAME parameter.
    fileprivate func setupNameStackView() {
        
        addPaddingView(to: nameTextField)
        
        // Make a vertical stack for NAME parameter.
        let nameStackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.axis = .vertical
        nameStackView.spacing = 7
        
        view.addSubview(nameStackView)
        
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 303),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            nameTextField.widthAnchor.constraint(equalToConstant: 303),
            
            nameStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -162.5),
            nameStackView.heightAnchor.constraint(equalToConstant: 71),
            nameStackView.widthAnchor.constraint(equalToConstant: 303)
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
            emailStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75.5),
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
    
    // This function adds the visibilityButton into textField.
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
            passwordStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 11.5),
            passwordStackView.heightAnchor.constraint(equalToConstant: 71),
            passwordStackView.widthAnchor.constraint(equalToConstant: 303)
        ])
    }
    
    // Create a button "Sign Up".
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 18)
        button.setTitle("Sign Up", for: .normal)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor(named: "Deep Blue")
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // Setup some constraints for Sign Up button.
    fileprivate func setupSignUpButton() {
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpButton.heightAnchor.constraint(equalToConstant: 60),
            signUpButton.widthAnchor.constraint(equalToConstant: 303),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 127)
        ])
    }
    
    // Create a label for ability to switch to Sign In screen.
    private let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "Already have an account?"
        label.textColor = UIColor(named: "Grey 2")
        label.font = UIFont(name: "Inter-Regular", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // Create a button to "Sign in" screen.
    private let signInButton: UIButton = {
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
        let attributedString = NSMutableAttributedString(string: "Sign in", attributes: buttonAttributes)
        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(switchToSignInViewController), for: .touchUpInside)
        
        return button
    }()
    
    // Function to move to Sign in screen.
    @objc private func switchToSignInViewController() {
        clearTextFields()
        
        let signInViewControllerAutoLayout = SignInViewControllerAutoLayout()
        signInViewControllerAutoLayout.modalPresentationStyle = .fullScreen
        
        present(signInViewControllerAutoLayout, animated: true, completion: nil)
    }
    
    //Clear textfields when move from Sign Up screen.
    private func clearTextFields() {
        
        nameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    // Setup some constraints for stack that allows to switch to Sign in screen.
    fileprivate func setupBottomStackView() {
        let bottomStackView = UIStackView(arrangedSubviews: [bottomLabel, signInButton])
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
        
        setupSignUpLabel()
        setupNameStackView()
        setupEmailStackView()
        setupPasswordStackView()
        setupSignUpButton()
        setupBottomStackView()
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        view.backgroundColor = .white
        
        //Hide keyboard when tap outside textfield
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
}

//MARK: - UITextFieldDelegate
extension SignUpViewControllerAutoLayout: UITextFieldDelegate {

    //Dismiiss keyboard when return button is pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
