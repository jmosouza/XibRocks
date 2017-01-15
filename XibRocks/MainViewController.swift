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

final class MainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var challengeHandler: ChallengeHandler?
    var challenge: BaseChallenge?
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
        
        var challengeHandler = MainViewController.generateChallengeViewController()
        challengeHandler.delegate = self
        challengeHandler.challenge = challenge
        
        let challengeHandlerVC = challengeHandler as! UIViewController
        addChildViewController(challengeHandlerVC)
        challengeHandlerVC.didMove(toParentViewController: self)
        challengeHandlerVC.view.frame =
            CGRect(x: 0,
                   y: 0,
                   width: containerView.frame.width,
                   height: containerView.frame.height)
        containerView.addSubview(challengeHandlerVC.view)
    }
    
    class func generateChallengeViewController() -> ChallengeHandler {
        return OptionsViewController()
    }
    
    class func generateChallenge() -> BaseChallenge {
        
        let options = [
            "GitHub",
            "Bitbucket",
            "GitLab",
            "Other"
        ]

        let challenge = OptionsChallenge()
        challenge.question = "What's your favorite git service?"
        challenge.answer = "GitHub"
        challenge.options = options
        
        return challenge
    }

}

extension MainViewController: ChallengeHandlerDelegate {
    
    func challengeDidAnswerRight() {
        label.text = "Your are correct!"
    }
    
    func challengeDidAnswerWrong() {
        label.text = "Try again..."
    }
    
}
