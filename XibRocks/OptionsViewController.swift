//
//  OptionsViewController.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit

class OptionsViewController: ChallengeViewController {
    
    func didAnswer(sender: UIButton) {
        
        let index = sender.tag
        
        if let option = challenge?.options[index],
            let success = challenge?.answer(option), success {
            delegate?.challengeDidAnswerRight()
        } else {
            delegate?.challengeDidAnswerWrong()
        }
    }

}

extension OptionsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return challenge?.options.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UIView.fromNib() as OptionsCell
        if let option = challenge?.options[indexPath.row] {
            cell.button.tag = indexPath.row
            cell.button.setTitle(option, for: .normal)
            cell.button.addTarget(self, action: #selector(didAnswer), for: .touchUpInside)
        }
        return cell
    }

}
