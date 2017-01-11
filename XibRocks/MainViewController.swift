//
//  MainViewController.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Challenge text here"
        
        let childViewController = gameViewController()
        addChildViewController(childViewController)
        childViewController.didMove(toParentViewController: self)
        childViewController.delegate = self
        childViewController.view.frame =
            CGRect(x: 0,
                   y: 0,
                   width: containerView.frame.width,
                   height: containerView.frame.height)
        containerView.addSubview(childViewController.view)
    }
    
    func gameViewController() -> ChallengeViewController {
        return OptionsViewController()
    }

}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        label.text = textField.text
    }
    
}

extension MainViewController: ChallengeDelegate {
    
    func didPressButton() {
        label.text = "You pressed the button!"
    }
    
}
