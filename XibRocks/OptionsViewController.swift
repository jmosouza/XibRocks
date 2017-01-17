//
//  OptionsViewController.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit

/**
 Display one options-style challenge and handle player input.
 */
final class OptionsViewController: UIViewController, ChallengeHandler {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: ChallengeHandlerDelegate?
    var baseChallenge: BaseChallenge?
    var challenge: OptionsChallenge? {
        get {
            return self.baseChallenge as? OptionsChallenge
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: TODO read current challenge from singleton
    }
    
    func didAnswer(sender: UIButton) {
        
        let index = sender.tag
        
        if let option = challenge?.options?[index],
            let success = challenge?.checkAnswer(option), success {
            delegate?.challengeDidAnswerRight()
        } else {
            delegate?.challengeDidAnswerWrong()
        }
    }

}

extension OptionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenge?.options?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UIView.fromNib() as OptionsCell
        if let option = challenge?.options?[indexPath.row] {
            cell.button.tag = indexPath.row
            cell.button.setTitle(option, for: .normal)
            cell.button.addTarget(self, action: #selector(didAnswer), for: .touchUpInside)
        }
        return cell
    }

}
