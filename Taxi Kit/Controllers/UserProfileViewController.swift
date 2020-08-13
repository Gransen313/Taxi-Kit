//
//  UserProfileViewController.swift
//  Taxi Kit
//
//  Created by Sergey Borisov on 13.08.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Detect swipe down gesture.
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    //Move to User Menu screen from right to left.
    @IBAction func closeProfileButtonPressed(_ sender: UIButton) {
        
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: true)
    }
    
    //Move to User Menu screen if swipe down.
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            if swipeGesture.direction == .down {
                dismiss(animated: true, completion: nil)
            }
        }
    }
}
