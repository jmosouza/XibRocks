//
//  ChildViewController.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    
    var delegate: ChildDelegate?

    @IBAction func didPressButton(_ sender: Any) {
        if let delegate = delegate {
            delegate.didPressButton()
        }
    }
}
