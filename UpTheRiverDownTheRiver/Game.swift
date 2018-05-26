//
//  Game.swift
//  UpTheRiverDownTheRiver
//
//  Created by Peter Foti on 5/25/18.
//  Copyright © 2018 PeterFoti. All rights reserved.
//

import Foundation


final class Game {
    private(set) var deck: Deck
    let players: [Player]
    private var currentDealerIndex: Int = 0
    private var currentGuesserIndex: Int = 1
    private var numberOfConsecutiveIncorrectGueses = 0
    
    
    init(deck: Deck, players: [Player]) {
        self.deck = deck
        self.players = players
    }
    
    
    func play() {
        while deck.hasCards() {
            guard let next = deck.nextCard() else {
                break
            }
            
            var lastDirective: Directive?
            
            let dealer = players[currentDealerIndex]
            var guesser = players[currentGuesserIndex]
            
            var guessedCorrectly = false
            let (card, index) = next
            
            if dealer == guesser {
                currentGuesserIndex += 1
                guesser = players[currentGuesserIndex]
            }
            
            if currentGuesserIndex == players.count - 1 {
                currentGuesserIndex = 0
            }
            
            let guess = guesser.guess(deck, directive: lastDirective)
            
            print("\(guesser) guesses \(guess)")
            let directive = dealer.upOrDown(actualCard: card, guess: guess)
            switch directive {
            case .exact:
                print("\(guesser) guessed \(card) correctly")
                guessedCorrectly = true
            case .higher:
                lastDirective = .higher
                print("Dealer says higher")
            case .lower:
                lastDirective = .lower
                print("Dealer says lower")
            }
            
            if guessedCorrectly {
                numberOfConsecutiveIncorrectGueses = 0
                deck.remove(at: index)
                
                currentGuesserIndex += 1
                
                print("\(dealer) reveals \(card)")
                separator()
                
                continue
            }
            
            let secondGuess = guesser.guess(deck, directive: lastDirective)
            
            print("\(guesser) guesses \(secondGuess)")
            let secondDirective = dealer.upOrDown(actualCard: card, guess: secondGuess)
            switch secondDirective {
            case .exact:
                print("\(guesser) guessed \(card) correctly")
                guessedCorrectly = true
            case .higher, .lower:
                lastDirective = secondDirective
            }
            
            print("\(dealer) reveals \(card)")
            
            deck.remove(at: index)
            
            currentGuesserIndex += 1
            
            if !guessedCorrectly {
                numberOfConsecutiveIncorrectGueses += 1
            } else {
                numberOfConsecutiveIncorrectGueses = 0
            }
            
            if numberOfConsecutiveIncorrectGueses == 3 {
                currentDealerIndex += 1
                
                if currentDealerIndex == players.count - 1 {
                    currentDealerIndex = 0
                }
                
                numberOfConsecutiveIncorrectGueses = 0
            }
            
            separator()
        }
        
        let endingDealer = players[currentDealerIndex]
        print("Last dealer: \(endingDealer)")
        print("Game over")
    }
    
    func separator() {
        print("--------------------------------------------------------------------------------")
    }
}
