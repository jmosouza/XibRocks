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
    
    var challenge: Challenge?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        challenge = MainViewController.generateChallenge()
        
        label.text = challenge?.question
        
        let childViewController = MainViewController.generateChallengeViewController()
        addChildViewController(childViewController)
        childViewController.didMove(toParentViewController: self)
        childViewController.delegate = self
        childViewController.challenge = challenge
        childViewController.view.frame =
            CGRect(x: 0,
                   y: 0,
                   width: containerView.frame.width,
                   height: containerView.frame.height)
        containerView.addSubview(childViewController.view)
    }
    
    class func generateChallengeViewController() -> ChallengeViewController {
        return OptionsViewController()
    }
    
    class func generateChallenge() -> Challenge {
        
        let options = [
            "GitHub",
            "Bitbucket",
            "GitLab",
            "Other"
        ]
        
        let challenge = Challenge(
            question: "What's your favorite git service?",
            answer: "GitHub",
            options: options)
        
        return challenge
    }

}

extension MainViewController: ChallengeDelegate {
    
    func challengeDidAnswerRight() {
        label.text = "Your are correct!"
    }
    
    func challengeDidAnswerWrong() {
        label.text = "Try again..."
    }
    
}
