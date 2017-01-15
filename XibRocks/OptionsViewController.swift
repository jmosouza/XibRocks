//
//  OptionsViewController.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit

final class OptionsViewController: UIViewController, ChallengeHandler {
    
    var optionsChallenge: OptionsChallenge?
    var delegate: ChallengeHandlerDelegate?
    var challenge: BaseChallenge? {
        didSet {
            self.optionsChallenge = challenge as! OptionsChallenge?
        }
    }
    
    func didAnswer(sender: UIButton) {
        
        let index = sender.tag
        
        if let option = optionsChallenge?.options?[index],
            let success = optionsChallenge?.checkAnswer(option), success {
            delegate?.challengeDidAnswerRight()
        } else {
            delegate?.challengeDidAnswerWrong()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsChallenge = challenge as! OptionsChallenge?
    }

}

extension OptionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsChallenge?.options?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UIView.fromNib() as OptionsCell
        if let option = optionsChallenge?.options?[indexPath.row] {
            cell.button.tag = indexPath.row
            cell.button.setTitle(option, for: .normal)
            cell.button.addTarget(self, action: #selector(didAnswer), for: .touchUpInside)
        }
        return cell
    }

}
