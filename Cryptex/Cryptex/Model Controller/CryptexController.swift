//
//  CryptexController.swift
//  Cryptex
//
//  Created by Enayatullah Naseri on 5/28/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import Foundation

class CryptexController {
    
    private(set) var cryptex: [Cryptex] = [Cryptex(password: "PASSWORD", hint: "Password is first of the Hint"), Cryptex(password: "OREGON", hint: "The state I am currently in"), Cryptex(password: "SUN", hint: "The star we can see every day")]
    
    init () {
        randomCryptex()
        
    }
    
    
    var currentCryptex: Cryptex?
    
    func randomCryptex() {
        currentCryptex = cryptex.randomElement()
    }
    
    
}
