//
//  UserMenuViewController.swift
//  Taxi Kit
//
//  Created by Sergey Borisov on 12.08.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class UserMenuViewController: UIViewController {
    
    @IBOutlet weak var signOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setColorForSignOutButton()
    }
    
    //Move to User Profile screen from left to right.
    @IBAction func editButtonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "UserProfile", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ToUserProfile") as UIViewController
        vc.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(vc, animated: false, completion: nil)
    }
    
    //Move to Map screen from right to left.
    @IBAction func closeMenuPressed(_ sender: UIButton) {
        
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: true)
    }
    
    //Move to Sign in screen.
    @IBAction func signOutPressed(_ sender: UIButton) {
        
        presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    //Set "Deep Blue" color for signOutButton's label.
    private func setColorForSignOutButton() {
        
        let attributes = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                          NSAttributedString.Key.foregroundColor: UIColor(named: "Deep Blue") as Any]
        let attributedString = NSMutableAttributedString(string: "Sign out", attributes: attributes)
        
        signOutButton.setAttributedTitle(attributedString, for: .normal)
    }
}
