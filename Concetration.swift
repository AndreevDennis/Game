//
//  Concetration.swift
//  GameCards
//
//  Created by Денис Андреев on 7/23/19.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import Foundation

class Concrentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyfaceUPCard: Int?
    
    func chooseCard(ar index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyfaceUPCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUP = true
                indexOfOneAndOnlyfaceUPCard = nil
            } else {
                for flipDown in cards.indices{
                    cards[flipDown].isFaceUP = false
                }
                cards[index].isFaceUP = true
                indexOfOneAndOnlyfaceUPCard = index
            }
        }
    }
    
    init(numberOfPairsCards:Int){
        for _ in 1...numberOfPairsCards {
            let card = Card()
            cards += [card,card] // double append
        }
        
    }
    
    //make func shuffle the cards
}
