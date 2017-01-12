//
//  Challenge.swift
//  XibRocks
//
//  Created by João Marcelo on 11/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import Foundation

struct Challenge {
    
    var question: String
    var answer: String
    var options: [String]
    
    func answer(_ answer: String) -> Bool {
        return answer == self.answer
    }
    
}
