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


enum Directive {
    case higher, lower, exact
}
