//
//  OptionsChallenge.swift
//  XibRocks
//
//  Created by João Marcelo on 15/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import Foundation

/**
 In this type of challenge, the user needs to choose the answer from a list of options.
 */
final class OptionsChallenge: BaseChallenge {

    /** List of possible answers for the user to choose from, including the correct answer. */
    var options: [String]?
    
    override init() {
        super.init()
    }
    
    init(dictionary: NSDictionary) {
        self.options = dictionary.value(forKey: "options") as! [String]?
        super.init()
        self.question = dictionary.value(forKey: "question") as? String
        self.answer = dictionary.value(forKey: "answer") as? String
    }
    
}
