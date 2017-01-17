//
//  CoreChallenge.swift
//  XibRocks
//
//  Created by João Marcelo on 16/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

import Foundation

/**
 Perform challenge-related actions.
 */
final class CoreChallenge {
    
    /**
     Get a ChallengeHandler object appropriate for the next challenge and set its delegate.
     
     - returns:
     An object conforming to ChallengeHandler.
     */
    class func nextHandler(delegate: ChallengeHandlerDelegate) -> ChallengeHandler {
        var handler = nextHandler()
        handler.delegate = delegate
        return handler
    }
    
    /**
     Get a ChallengeHandler object appropriate for the next challenge.
     
     - returns:
     An object conforming to ChallengeHandler.
     */
    private class func nextHandler() -> ChallengeHandler {
        let foo = "AnswerRight"
        switch foo {
        case "AnswerRight":
            return OptionsViewController()
        default:
            return OptionsViewController()
        }
    }

}
