//
//  Deck.swift
//  UpTheRiverDownTheRiver
//
//  Created by Peter Foti on 5/25/18.
//  Copyright © 2018 PeterFoti. All rights reserved.
//

import Foundation


struct Deck : CustomStringConvertible {
    private var cards: [Card]
    
    var description: String {
        let descriptions = cards.map({$0.description})
        return descriptions.joined(separator: "\n")
    }
    
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    
    mutating func shuffle() {
        cards = cards.shuffled()
    }
    
    
    mutating func nextCard() -> (Card, Int)? {
        guard let card = cards.last else {
            return nil
        }
        
        return (card, cards.count - 1)
    }
    
    
    mutating func remove(at index: Int) {
        cards.remove(at: index)
    }
    
    
    func middleIndex() -> Int {
        return cards.count / 2
    }
    
    
    func hasCards() -> Bool {
        return !cards.isEmpty
    }
    
    
    func cards(higherThan someCard: Card) -> Deck {
        let cards = self.cards.filter({ (card) -> Bool in
            return card > someCard
        })
        return Deck(cards: cards)
    }
    
    
    func cards(lowerThan someCard: Card) -> Deck {
        let cards = self.cards.filter({ (card) -> Bool in
            return card < someCard
        })
        return Deck(cards: cards)
    }
    
    
    func randomCard() -> Card {
        let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
        return cards[randomIndex]
    }
}
