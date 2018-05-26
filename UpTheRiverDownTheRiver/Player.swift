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
    private var lastGuess: Card?
    
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

                return guess(from: higherCards)
            } else if case Directive.lower = directive {
                let lowerCards = deck.cards(lowerThan: _lastGuess)

                return guess(from: lowerCards)
            }
        }
        
        return guess(from: deck)
    }
    
    
    private func guess(from deck: Deck) -> Card {
        /// Gathers middle card and the cards to its immediate left and right
        let (before, middle, after) = deck.middleCards()
        
        let remainingMiddle = deck.remainingEqualTo(middle)
        let remainingBefore = deck.remainingEqualTo(before)
        let remainingAfter = deck.remainingEqualTo(after)
        
        let middlePct: Double = (Double(remainingMiddle) / Double(deck.count())) * 100
        let beforePct: Double = (Double(remainingBefore) / Double(deck.count())) * 100
        let afterPct: Double = (Double(remainingAfter) / Double(deck.count())) * 100
        
        print("Before: \(before) - \(format(double: beforePct)) | Middle: \(middle) - \(format(double: middlePct)) | After: \(after) - \(format(double: afterPct))")
        
        let cardToReturn: Card
        
        if middlePct >= beforePct && middlePct >= afterPct {
            cardToReturn = middle
            lastGuess = middle
        } else if beforePct >= middlePct && beforePct >= afterPct {
            lastGuess = before
            cardToReturn = before
        } else if afterPct >= middlePct && afterPct >= beforePct {
            cardToReturn = after
            lastGuess = after
        } else {
            let guess = deck.randomCard()
            cardToReturn = guess
            lastGuess = guess
        }
        
        return cardToReturn
    }
    
    
    private func format(double: Double) -> String {
        return String(format: "%.2f", double)
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
