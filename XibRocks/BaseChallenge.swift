//
//  BaseChallenge.swift
//  XibRocks
//
//  Created by João Marcelo on 15/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

/**
 Common interface to all types of challenge.
 Enforces the question, the answer and the method to check if the answer is correct.
 */
class BaseChallenge {
    
    /** The question displayed to the player. */
    final var question: String?
    
    /** The answer technically correct. */
    final var answer: String?
    
    /**
     Check wether the player's answer matches the challenge's answer.
     
     - parameters:
     - answer: The player's answer.
     
     - returns:
     `true` if the player's answer is right, `false` otherwise.
     */
    final func checkAnswer(_ answer: String) -> Bool {
        return self.answer == answer
    }
    
}
