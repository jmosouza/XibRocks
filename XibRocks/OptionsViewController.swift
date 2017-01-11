//
//  OptionsViewController.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (view as! UITableView).dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UIView.fromNib() as OptionsCell
        cell.button.setTitle("Option \(indexPath.row)", for: .normal)
        return cell
    }

}
