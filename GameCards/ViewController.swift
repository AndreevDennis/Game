//
//  ViewController.swift
//  GameCards
//
//  Created by Денис Андреев on 7/21/19.
//  Copyright © 2019 Денис Андреев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount : Int = 0 {
        didSet {
             flipLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojiChoice: Array<Any>  = ["😎","😘","😎","😘"]
    
    
    @IBOutlet weak var flipLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!
  

    @IBAction func touchCard(_ sender: UIButton) {
         flipCount += 1
        if  let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoice[cardNumber] as! String, on: sender)
        } else {
            print("Error")
        }
        

    }
    
  
    
    func flipCard(withEmoji emoji:String,on button : UIButton){
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = .orange
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
        }
    }
    
}

