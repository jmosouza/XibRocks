//
//  ChallengeHandlerDelegate.swift
//  XibRocks
//
//  Created by João Marcelo on 10/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

/**
 Receive notifications about events on a ChallengeHandler class.
 */
protocol ChallengeHandlerDelegate {
    
    func challengeDidAnswerRight()
    func challengeDidAnswerWrong()
    
}
