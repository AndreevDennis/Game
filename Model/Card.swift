//
//  Card.swift
//  GameCards
//
//  Created by Денис Андреев on 7/23/19.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUP  = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        Card.identifierFactory += 1
        return  identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
