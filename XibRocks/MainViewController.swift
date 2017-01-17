//
//  MainViewController.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit

/**
 Display new challenge handlers for each challenge.
 */
final class MainViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    var challengeHandler: ChallengeHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        challengeHandler = CoreChallenge.nextHandler(delegate: self)
        configureChallengeHandler(challengeHandler as! UIViewController, containerView: view)
    }
    
    private func configureChallengeHandler(
        _ controller: UIViewController,
        containerView: UIView) {
        
        addChildViewController(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }

}

extension MainViewController: ChallengeHandlerDelegate {
    
    func challengeDidAnswerRight() {
        print("Your are correct!")
    }
    
    func challengeDidAnswerWrong() {
        print("Try again...")
    }
    
}
