//
//  main.swift
//  UpTheRiverDownTheRiver
//
//  Created by Peter Foti on 5/25/18.
//  Copyright © 2018 PeterFoti. All rights reserved.
//

import Foundation

var deck = Deck(cards: Card.allCards)
deck.shuffle()

let player1 = Player(name: "Peter")
let player2 = Player(name: "Prachi")
let player3 = Player(name: "Kaz")
let player4 = Player(name: "Pooja")

let game = Game(deck: deck, players: [player1, player2, player3, player4])

game.play()
