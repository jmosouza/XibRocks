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
    
    var database: FIRDatabaseReference?
    var challenges: [OptionsChallenge]?
    
    var challengeIndex: Int?
    
    var challengeHandler: ChallengeHandler?
    
    var challenge: BaseChallenge? {
        didSet {
            if let c = challenge {
                label.text = c.question
            }
            if var ch = challengeHandler {
                ch.challenge = challenge
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        challengeIndex = 0
        challengeHandler = MainViewController.generateChallengeViewController()
        challengeHandler?.delegate = self
        
        let challengeHandlerVC = challengeHandler as! UIViewController
        
        addChildViewController(challengeHandlerVC)
        challengeHandlerVC.didMove(toParentViewController: self)
        challengeHandlerVC.view.frame =
            CGRect(x: 0,
                   y: 0,
                   width: containerView.frame.width,
                   height: containerView.frame.height)
        containerView.addSubview(challengeHandlerVC.view)
        
        challenges = []
        database = FIRDatabase.database().reference()
        if let database = database, challenges != nil {
            let query = database.child("questions").queryLimited(toFirst: 100)
            query.observeSingleEvent(of: .value) { (snapshot: FIRDataSnapshot) in
                for child in snapshot.children {
                    let snapshotChild = child as! FIRDataSnapshot
                    if let challenge = snapshotChild.value as? NSDictionary {
                        print(challenge["question"] ?? "...")
                        self.challenges?.append(OptionsChallenge(dictionary: challenge))
                    }
                }
                self.challenge = self.challenges?[0]
            }
        }
        
        challenge = MainViewController.generateChallenge()

    }

}

extension MainViewController {

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
        challengeIndex! += 1
        challenge = challenges![challengeIndex!]
    }
    
    func challengeDidAnswerWrong() {
        label.text = "Try again..."
    }
    
}
