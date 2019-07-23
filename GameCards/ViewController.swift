//
//  ViewController.swift
//  GameCards
//
//  Created by Денис Андреев on 7/21/19.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    lazy var game = Concrentration(numberOfPairsCards: (cardButtons.count + 1) / 2)
    
    var flipCount : Int = 0 {
        didSet {
            flipLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if  let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(ar: cardNumber)
            updateViewFromModel()
        } else {
            print("Error")
        }
        
        
    }
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUP {
                button.setTitle(emojiFunc(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    
    var emojiChoice: Array<Any>  = ["😎","😘","🥶","🥳","🤨","😓","🤢","👽","🐝"]
    var emoji =  [Int:String]()
    
    func emojiFunc(for card: Card)-> String {
        
        if emoji[card.identifier] == nil, emojiChoice.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoice.count)))
            emoji[card.identifier] = (emojiChoice.remove(at:randomIndex) as! String)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    
    
}

