//
//  VerifyCodeViewController.swift
//  Taxi Kit
//
//  Created by Sergey Borisov on 13.07.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class VerifyCodeViewController: UIViewController {
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var thirdNumberLabel: UILabel!
    @IBOutlet weak var forthNumberLabel: UILabel!
    
    @IBOutlet weak var getCallButton: UIButton!
    
    @IBOutlet weak var resendCodeButton: UIButton!
    
    private var counter = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCallButton.isHidden = true
        getCallButton.isEnabled = false
        
        // Do any additional setup after loading the view.
        
        setColorForResendCodeButton()
    }
    
    //Dismiss VerifyCodeViewController.
    @IBAction func navigationButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resendCodeButtonPressed(_ sender: UIButton) {
        print("resendCodeButton pressed")
        
        
        if let text = sender.titleLabel?.text {
            print(text)
            changeButtonText(with: text)
        }
    }
    
    @IBAction func getCallButtonPressed(_ sender: UIButton) {
        print("getCallButton pressed")
    }
    
    @IBAction func checkButtonPressed(_ sender: UIButton) {
        print("checkButton pressed")
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        
        if forthNumberLabel.text != "" {
            forthNumberLabel.text = ""
        } else if thirdNumberLabel.text != "" {
            thirdNumberLabel.text = ""
        } else if secondNumberLabel.text != "" {
            secondNumberLabel.text = ""
        } else if firstNumberLabel.text != "" {
            firstNumberLabel.text = ""
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if let number = sender.titleLabel?.text{
//            print(number)
            setNumber(with: number)
        }
    }
    
    //Set color and underline style for resendCodeButton.
    private func setColorForResendCodeButton() {
        let attributes = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                          NSAttributedString.Key.foregroundColor: UIColor(named: "Grey 2") as Any]
        let attributedString = NSMutableAttributedString(string: "Resend code", attributes: attributes)
        resendCodeButton.setAttributedTitle(attributedString, for: .normal)
    }
    
    private func setNumber(with number: String) {
        
        if firstNumberLabel.text == "" {
            firstNumberLabel.text = number
        } else if secondNumberLabel.text == "" {
            secondNumberLabel.text = number
        } else if thirdNumberLabel.text == "" {
            thirdNumberLabel.text = number
        } else if forthNumberLabel.text == "" {
            forthNumberLabel.text = number
        }
    }
    
    private func changeButtonText(with text: String) {
        
        if text == "Resend code" {
            
            resendCodeButton.isEnabled = false
            
            startTimer()
        }
    }
    
    private func startTimer() {

        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func updateCounter() {
        //example functionality
        if counter >= 0 {
            
            let attributes = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                              NSAttributedString.Key.foregroundColor: UIColor(named: "Deep Blue") as Any]
            let attributedString = NSMutableAttributedString(string: "Resend code ( 0:\(counter) )", attributes: attributes)
            resendCodeButton.setAttributedTitle(attributedString, for: .normal)
            
            counter -= 1
        } else if counter < 1 {
            
            let attributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "Grey 2")]
            let attributedString = NSMutableAttributedString(string: "The SMS with the code didn’t arrive?", attributes: attributes as [NSAttributedString.Key : Any])
            resendCodeButton.setAttributedTitle(attributedString, for: .normal)
            
            getCallButton.isHidden = false
            getCallButton.isEnabled = true
            
            resendCodeButton.isEnabled = false
        }
    }
}
