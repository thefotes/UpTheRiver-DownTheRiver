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
    
    
    // MARK: Mutating
    mutating func shuffle() {
        cards = cards.shuffled()
    }
    
    
    /// Pops the last card and returns it along with its index
    mutating func nextCard() -> (Card, Int)? {
        guard let card = cards.last else {
            return nil
        }
        
        return (card, cards.count - 1)
    }
    
    
    /// Removes card at a given index
    mutating func remove(at index: Int) {
        cards.remove(at: index)
    }
    
    
    /// Returns total number of cards remaining
    func count() -> Int {
        return cards.count
    }
    
    
    /// Returns card at a given index
    func card(at index: Int) -> Card {
        return cards[index]
    }
    
    
    /// Takes unique values for remaning cards and sorts them
    /// Finds middle index of remaining
    /// Returns card at index before, after, and in the middle.
    func middleCards() -> (before: Card, middle: Card, after: Card) {
        var uniqueValues: Set<Int> = []
        
        for card in cards {
            uniqueValues.insert(card.cardValue.intValue)
        }
        
        let sorted = uniqueValues.sorted(by: { (card1, card2) -> Bool in
            return card1 < card2
        })
        
        let middleIndex = sorted.count / 2
        let middleValue = sorted[middleIndex]
        // Do not go above sorted.count
        let afterValue = sorted[min(middleIndex + 1, sorted.count - 1)]
        // Do not go below 0
        let beforeValue = sorted[max(middleIndex - 1, 0)]
        
        let middleCard = findCard(with: middleValue)
        let before = findCard(with: beforeValue)
        let after = findCard(with: afterValue)
        
        return (before!, middleCard!, after!)
    }
    
    
    /// Returns the first card in deck where its cardValue is equal to the passed in value
    func findCard(with value: Int) -> Card? {
        return cards.first(where: { (input) -> Bool in
            return input.cardValue.intValue == value
        })
    }
    
    
    /// Returns true if there are still cards in the deck
    func hasCards() -> Bool {
        return !cards.isEmpty
    }
    
    
    /// Returns cards in deck whos value is greater than someCard
    func cards(higherThan someCard: Card) -> Deck {
        let cards = self.cards.filter({ (card) -> Bool in
            return card > someCard
        })
        return Deck(cards: cards)
    }
    
    
    /// Retruns cards in deck whos value is less than someCard
    func cards(lowerThan someCard: Card) -> Deck {
        let cards = self.cards.filter({ (card) -> Bool in
            return card < someCard
        })
        return Deck(cards: cards)
    }
    
    
    /// Returns a randomCard from the deck
    func randomCard() -> Card {
        let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
        return cards[randomIndex]
    }
    
    
    /// Returns the total number of cards whos cardValue is equal to card
    func remainingEqualTo(_ card: Card?) -> Int {
        guard let card = card else {
            return 0
        }
        return cards.filter({ (input) -> Bool in
            return input == card
        }).count
    }
}
