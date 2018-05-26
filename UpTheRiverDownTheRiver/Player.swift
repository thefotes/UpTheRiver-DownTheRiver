//
//  Player.swift
//  UpTheRiverDownTheRiver
//
//  Created by Peter Foti on 5/25/18.
//  Copyright © 2018 PeterFoti. All rights reserved.
//

import Foundation


protocol Dealer {
    func upOrDown(actualCard: Card, guess: Card) -> Directive
}


final class Player : Dealer, CustomStringConvertible {
    let name: String
    var isDealer: Bool = false
    private(set) var lastGuess: Card?
    
    var description: String {
        return name
    }
    
    
    init(name: String) {
        self.name = name
    }
    
    
    func guess(_ deck: Deck, directive: Directive?) -> Card {
        if let _lastGuess = lastGuess, let directive = directive {
            if case Directive.higher = directive {
                let higherCards = deck.cards(higherThan: _lastGuess)
                let guess = higherCards.randomCard()
                lastGuess = guess
                return guess
            } else if case Directive.lower = directive {
                let lowerCards = deck.cards(lowerThan: _lastGuess)
                let guess = lowerCards.randomCard()
                lastGuess = guess
                return guess
            }
        }
        
        let guess = deck.randomCard()
        lastGuess = guess
        return guess
    }
    
    
    // MARK: Dealer
    func upOrDown(actualCard: Card, guess: Card) -> Directive {
        if actualCard == guess {
            return .exact
        } else if actualCard.cardValue.intValue > guess.cardValue.intValue {
            return .higher
        } else {
            return .lower
        }
    }
}
