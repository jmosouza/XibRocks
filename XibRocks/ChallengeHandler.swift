//
//  ChallengeHandler.swift
//  XibRocks
//
//  Created by João Marcelo on 11/01/17.
//  Copyright © 2017 João Marcelo Oliveira de Souza. All rights reserved.
//

protocol ChallengeHandler {

    var baseChallenge: BaseChallenge? { get set }
    var delegate: ChallengeHandlerDelegate? { get set }

}
