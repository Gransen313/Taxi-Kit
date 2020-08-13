//
//  MapViewController.swift
//  Taxi Kit
//
//  Created by Sergey Borisov on 12.08.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Move to User Menu screen from left to right.
    @IBAction func menuButtonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "UserMenu", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ToUserMenu") as UIViewController
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(vc, animated: false, completion: nil)
    }
}
