//
//  MainViewController.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var challenge: Challenge?
    var database: FIRDatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        database = FIRDatabase.database().reference()
        
        if database != nil {
            let query = database?.child("questions").queryLimited(toFirst: 100)
            query?.observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
                for child in snapshot.children {
                    let snapshotChild = child as! FIRDataSnapshot
                    let challenge = snapshotChild.value as? NSDictionary
                    print(challenge?["question"] ?? "...")
                }
            }
        }
        
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
