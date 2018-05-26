//
//  Card.swift
//  UpTheRiverDownTheRiver
//
//  Created by Peter Foti on 5/25/18.
//  Copyright © 2018 PeterFoti. All rights reserved.
//

import Foundation


enum Suit : String, CustomStringConvertible {
    case spade = "s"
    case diamond = "d"
    case heart = "h"
    case club = "c"
    
    var description: String {
        return rawValue
    }
    
    static let allSuits: [Suit] = [.spade, .diamond, .heart, .club]
}


func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.cardValue.intValue == rhs.cardValue.intValue && lhs.suit == rhs.suit
}

func ==(lhs: Player, rhs: Player) -> Bool {
    return lhs.name == rhs.name
}

struct Card : CustomStringConvertible {
    let suit: Suit
    let cardValue: CardValue
    
    var description: String {
        return "\(cardValue.rawValue)\(suit)"
    }
    static let allCards: [Card] = {
        var _allCards: [Card] = []
        for cardValue in CardValue.allCardValues {
            for suit in Suit.allSuits {
                _allCards.append(Card(suit: suit, cardValue: cardValue))
            }
        }

        return _allCards
    }()
}


struct Deck : CustomStringConvertible {
    var cards: [Card]
    
    var description: String {
        let descriptions = cards.map({$0.description})
        return descriptions.joined(separator: "\n")
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
}


extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

enum Directive {
    case higher, lower, exact
}

protocol Dealer {
    func upOrDown(actualCard: Card, guess: Card) -> Directive
}

final class Player : Dealer, CustomStringConvertible {
    let name: String
    var isDealer: Bool = false
    
    var description: String {
        return name
    }
    
    init(name: String) {
        self.name = name
    }
    
    func guess(_ deck: Deck) -> Card {
        let randomIndex = Int(arc4random_uniform(UInt32(deck.cards.count)))
        return deck.cards[randomIndex]
    }
    
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
