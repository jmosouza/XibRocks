//
//  OptionsChallenge.swift
//  XibRocks
//
//  Created by João Marcelo on 15/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

/**
 In this type of challenge, the user needs to choose the answer from a list of options.
 */
final class OptionsChallenge: BaseChallenge {

    /** List of possible answers for the user to choose from, including the correct answer. */
    var options: [String]?
    
}
