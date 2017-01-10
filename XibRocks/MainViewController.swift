//
//  MainViewController.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
}
