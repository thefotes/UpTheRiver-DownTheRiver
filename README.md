## Up the River, Down the River Simulation

- Standard 52 card deck
- Cards are numbered relative to their face value (Ace is high)
- 1-6 players

Face value: 2, 3, 4, 5, 6, 7, 8, 9, 10, J,  Q,  K,  A

Numeric value: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14

Random player starts as dealer

Player to dealers left guesses a card 2-A

Dealer checks top card to see if player was correct

If wrong, dealer tells the player whether the card hes holding is higher or lower than the guessed card

Player is then able to guess again

If wrong on second guess, dealer reveals card and the losing player must "drink" the difference between his/her final guess and the actual card value.

For example if the dealer is holding an 8 and the player guesses 2, the dealer responds by saying "higher". If the player then guesses K, then the player is 
wrong by K - 8 == 5 

Once a player has exhausted both guesses, the next guesser is the player to the left of the previous one.

Note - the dealer cannot be the guesser while he/she is the dealer.

If the player guesses correctly on either guess then the dealer must "drink".

If 3 players in a row do not guess the dealers card, the dealer becomes the player immediately to the left of the current dealer.

If a player guesses the dealers card correctly, the counter resets and the dealer must attempt to avoid a correct guess in three straight cards.

The dealer at the end of the game is the loser


## Algorithm
First guess:
Player chooses the middle'th card by value. They then choose a card immediately to the left and to the right of the middle card.
The player choose a card among the three so as to maximize the % remaining

Second guess:
Dealer responds by saying "higher" or "lower". User generates a new deck which contains only cards either higher or lower than the players original guess.
Player repeats first guess process.


## Start Game
```swift
var deck = Deck(cards: Card.allCards)
deck.shuffle()

let player1 = Player(name: "Peter")
let player2 = Player(name: "Prachi")
let player3 = Player(name: "Kaz")
let player4 = Player(name: "Pooja")

let game = Game(deck: deck, players: [player1, player2, player3, player4])

game.play()
```

## Output
```
Before: 7h - 7.69 | Middle: 8c - 7.69 | After: 9c - 7.69
Prachi guesses 8c
Dealer says higher
Before: Jd - 16.67 | Middle: Qd - 16.67 | After: Ks - 16.67
Prachi guesses Qd
Dealer (Peter) reveals 9s
--------------------------------------------------------------------------------
Before: 7h - 7.84 | Middle: 8c - 7.84 | After: 9c - 5.88
Kaz guesses 8c
Dealer says lower
Before: 4c - 16.67 | Middle: 5c - 16.67 | After: 6d - 16.67
Kaz guesses 5c
Dealer (Peter) reveals 2c
--------------------------------------------------------------------------------
Before: 7h - 8.00 | Middle: 8c - 8.00 | After: 9c - 6.00
Pooja guesses 8c
Dealer says higher
Before: Jd - 17.39 | Middle: Qd - 17.39 | After: Ks - 17.39
Pooja guesses Qd
Dealer (Peter) reveals Kd
--------------------------------------------------------------------------------
Before: 7h - 8.16 | Middle: 8c - 8.16 | After: 9c - 6.12
Kaz guesses 8c
Dealer says higher
Before: Jd - 18.18 | Middle: Qd - 18.18 | After: Ks - 13.64
Kaz guesses Qd
Dealer (Prachi) reveals Kc
--------------------------------------------------------------------------------
Before: 7h - 8.33 | Middle: 8c - 8.33 | After: 9c - 6.25
Pooja guesses 8c
Dealer says lower
Before: 4c - 17.39 | Middle: 5c - 17.39 | After: 6d - 17.39
Pooja guesses 5c
Dealer (Prachi) reveals 7s
--------------------------------------------------------------------------------
Before: 7h - 6.38 | Middle: 8c - 8.51 | After: 9c - 6.38
Kaz guesses 8c
Kaz guessed 8s correctly
Dealer (Prachi) reveals 8s
--------------------------------------------------------------------------------
Before: 7h - 6.52 | Middle: 8c - 6.52 | After: 9c - 6.52
Pooja guesses 8c
Dealer says lower
Before: 4c - 18.18 | Middle: 5c - 18.18 | After: 6d - 18.18
Pooja guesses 5c
Dealer (Prachi) reveals 2d
--------------------------------------------------------------------------------
Before: 7h - 6.67 | Middle: 8c - 6.67 | After: 9c - 6.67
Kaz guesses 8c
Dealer says higher
Before: Jd - 19.05 | Middle: Qd - 19.05 | After: Ks - 9.52
Kaz guesses Qd
Dealer (Prachi) reveals 10h
--------------------------------------------------------------------------------
Before: 7h - 6.82 | Middle: 8c - 6.82 | After: 9c - 6.82
Pooja guesses 8c
Dealer says lower
Before: 4c - 19.05 | Middle: 5c - 19.05 | After: 6d - 19.05
Pooja guesses 5c
Dealer (Prachi) reveals 4h
--------------------------------------------------------------------------------
Before: 7h - 6.98 | Middle: 8c - 6.98 | After: 9c - 6.98
Prachi guesses 8c
Dealer says higher
Before: Jd - 20.00 | Middle: Qd - 20.00 | After: Ks - 10.00
Prachi guesses Qd
Dealer (Kaz) reveals 9d
--------------------------------------------------------------------------------
Before: 7h - 7.14 | Middle: 8c - 7.14 | After: 9c - 4.76
Pooja guesses 8c
Dealer says lower
Before: 4c - 15.00 | Middle: 5c - 20.00 | After: 6d - 20.00
Pooja guesses 5c
Pooja guessed 5h correctly
Dealer (Kaz) reveals 5h
--------------------------------------------------------------------------------
Before: 7h - 7.32 | Middle: 8c - 7.32 | After: 9c - 4.88
Prachi guesses 8c
Dealer says lower
Before: 4c - 15.79 | Middle: 5c - 15.79 | After: 6d - 21.05
Prachi guesses 6d
Dealer (Kaz) reveals 5d
--------------------------------------------------------------------------------
Before: 7h - 7.50 | Middle: 8c - 7.50 | After: 9c - 5.00
Pooja guesses 8c
Dealer says higher
Before: Jd - 21.05 | Middle: Qd - 21.05 | After: Ks - 10.53
Pooja guesses Qd
Dealer (Kaz) reveals As
--------------------------------------------------------------------------------
Before: 7h - 7.69 | Middle: 8c - 7.69 | After: 9c - 5.13
Prachi guesses 8c
Dealer says lower
Before: 4c - 16.67 | Middle: 5c - 11.11 | After: 6d - 22.22
Prachi guesses 6d
Dealer (Kaz) reveals 5s
--------------------------------------------------------------------------------
Before: 7h - 7.89 | Middle: 8c - 7.89 | After: 9c - 5.26
Kaz guesses 8c
Dealer says higher
Before: Jd - 22.22 | Middle: Qd - 22.22 | After: Ks - 11.11
Kaz guesses Qd
Dealer (Peter) reveals 9h
--------------------------------------------------------------------------------
Before: 7h - 8.11 | Middle: 8c - 8.11 | After: 9c - 2.70
Pooja guesses 8c
Dealer says higher
Before: Jd - 23.53 | Middle: Qd - 23.53 | After: Ks - 11.76
Pooja guesses Qd
Dealer (Peter) reveals Js
--------------------------------------------------------------------------------
Before: 7h - 8.33 | Middle: 8c - 8.33 | After: 9c - 2.78
Prachi guesses 8c
Dealer says higher
Before: Jd - 18.75 | Middle: Qd - 25.00 | After: Ks - 12.50
Prachi guesses Qd
Dealer (Peter) reveals 10c
--------------------------------------------------------------------------------
Before: 7h - 8.57 | Middle: 8c - 8.57 | After: 9c - 2.86
Kaz guesses 8c
Dealer says lower
Before: 4c - 17.65 | Middle: 5c - 5.88 | After: 6d - 23.53
Kaz guesses 6d
Kaz guessed 6s correctly
Dealer (Prachi) reveals 6s
--------------------------------------------------------------------------------
Before: 7h - 8.82 | Middle: 8c - 8.82 | After: 9c - 2.94
Pooja guesses 8c
Dealer says higher
Before: Jd - 20.00 | Middle: Qd - 26.67 | After: Ks - 13.33
Pooja guesses Qd
Dealer (Prachi) reveals 10d
--------------------------------------------------------------------------------
Before: 7h - 9.09 | Middle: 8c - 9.09 | After: 9c - 3.03
Kaz guesses 8c
Dealer says higher
Before: Jd - 21.43 | Middle: Qd - 28.57 | After: Ks - 14.29
Kaz guesses Qd
Kaz guessed Qc correctly
Dealer (Prachi) reveals Qc
--------------------------------------------------------------------------------
Before: 7h - 9.38 | Middle: 8c - 9.38 | After: 9c - 3.12
Pooja guesses 8c
Dealer says lower
Before: 4c - 18.75 | Middle: 5c - 6.25 | After: 6d - 18.75
Pooja guesses 4c
Dealer (Prachi) reveals 3s
--------------------------------------------------------------------------------
Before: 7h - 9.68 | Middle: 8c - 9.68 | After: 9c - 3.23
Kaz guesses 8c
Dealer says lower
Before: 4c - 20.00 | Middle: 5c - 6.67 | After: 6d - 20.00
Kaz guesses 4c
Dealer (Prachi) reveals 3h
--------------------------------------------------------------------------------
Before: 7h - 10.00 | Middle: 8c - 10.00 | After: 9c - 3.33
Pooja guesses 8c
Dealer says higher
Before: Jd - 23.08 | Middle: Qd - 23.08 | After: Ks - 15.38
Pooja guesses Qd
Dealer (Prachi) reveals 9c
--------------------------------------------------------------------------------
Before: 7h - 10.34 | Middle: 8c - 10.34 | After: 10s - 3.45
Prachi guesses 8c
Dealer says lower
Before: 4c - 21.43 | Middle: 5c - 7.14 | After: 6d - 21.43
Prachi guesses 4c
Dealer (Kaz) reveals 6c
--------------------------------------------------------------------------------
Before: 7h - 10.71 | Middle: 8c - 10.71 | After: 10s - 3.57
Pooja guesses 8c
Pooja guessed 8d correctly
Dealer (Kaz) reveals 8d
--------------------------------------------------------------------------------
Before: 7h - 11.11 | Middle: 8c - 7.41 | After: 10s - 3.70
Prachi guesses 7h
Dealer says lower
Before: 3c - 20.00 | Middle: 4c - 30.00 | After: 5c - 10.00
Prachi guesses 4c
Dealer (Kaz) reveals 3d
--------------------------------------------------------------------------------
Before: 7h - 11.54 | Middle: 8c - 7.69 | After: 10s - 3.85
Pooja guesses 7h
Dealer says higher
Before: Jd - 21.43 | Middle: Qd - 21.43 | After: Ks - 14.29
Pooja guesses Qd
Pooja guessed Qs correctly
Dealer (Kaz) reveals Qs
--------------------------------------------------------------------------------
Before: 7h - 12.00 | Middle: 8c - 8.00 | After: 10s - 4.00
Prachi guesses 7h
Dealer says higher
Before: Jd - 23.08 | Middle: Qd - 15.38 | After: Ks - 15.38
Prachi guesses Jd
Dealer (Kaz) reveals 8h
--------------------------------------------------------------------------------
Before: 7h - 12.50 | Middle: 8c - 4.17 | After: 10s - 4.17
Pooja guesses 7h
Dealer says higher
Before: Jd - 25.00 | Middle: Qd - 16.67 | After: Ks - 16.67
Pooja guesses Jd
Dealer (Kaz) reveals Ac
--------------------------------------------------------------------------------
Before: 7h - 13.04 | Middle: 8c - 4.35 | After: 10s - 4.35
Prachi guesses 7h
Prachi guessed 7d correctly
Dealer (Kaz) reveals 7d
--------------------------------------------------------------------------------
Before: 7h - 9.09 | Middle: 8c - 4.55 | After: 10s - 4.55
Pooja guesses 7h
Dealer says higher
Before: Jd - 27.27 | Middle: Qd - 18.18 | After: Ks - 18.18
Pooja guesses Jd
Dealer (Kaz) reveals Ad
--------------------------------------------------------------------------------
Before: 7h - 9.52 | Middle: 8c - 4.76 | After: 10s - 4.76
Prachi guesses 7h
Dealer says lower
Before: 3c - 11.11 | Middle: 4c - 33.33 | After: 5c - 11.11
Prachi guesses 4c
Dealer (Kaz) reveals 6h
--------------------------------------------------------------------------------
Before: 7h - 10.00 | Middle: 8c - 5.00 | After: 10s - 5.00
Pooja guesses 7h
Dealer says higher
Before: Jd - 30.00 | Middle: Qd - 20.00 | After: Ks - 20.00
Pooja guesses Jd
Dealer (Kaz) reveals 8c
--------------------------------------------------------------------------------
Before: 6d - 5.26 | Middle: 7h - 10.53 | After: 10s - 5.26
Prachi guesses 7h
Dealer says lower
Before: 3c - 12.50 | Middle: 4c - 37.50 | After: 5c - 12.50
Prachi guesses 4c
Prachi guessed 4d correctly
Dealer (Peter) reveals 4d
--------------------------------------------------------------------------------
Before: 6d - 5.56 | Middle: 7h - 11.11 | After: 10s - 5.56
Kaz guesses 7h
Dealer says higher
Before: Jd - 33.33 | Middle: Qd - 22.22 | After: Ks - 22.22
Kaz guesses Jd
Dealer (Peter) reveals Kh
--------------------------------------------------------------------------------
Before: 6d - 5.88 | Middle: 7h - 11.76 | After: 10s - 5.88
Pooja guesses 7h
Dealer says lower
Before: 3c - 14.29 | Middle: 4c - 28.57 | After: 5c - 14.29
Pooja guesses 4c
Dealer (Peter) reveals 6d
--------------------------------------------------------------------------------
Before: 7h - 12.50 | Middle: 10s - 6.25 | After: Jd - 18.75
Prachi guesses Jd
Prachi guessed Jh correctly
Dealer (Peter) reveals Jh
--------------------------------------------------------------------------------
Before: 7h - 13.33 | Middle: 10s - 6.67 | After: Jd - 13.33
Kaz guesses 7h
Kaz guessed 7c correctly
Dealer (Peter) reveals 7c
--------------------------------------------------------------------------------
Before: 7h - 7.14 | Middle: 10s - 7.14 | After: Jd - 14.29
Pooja guesses Jd
Dealer says higher
Before: Qd - 50.00 | Middle: Ks - 25.00 | After: Ah - 25.00
Pooja guesses Qd
Dealer (Peter) reveals Ks
--------------------------------------------------------------------------------
Before: 5c - 7.69 | Middle: 7h - 7.69 | After: 10s - 7.69
Prachi guesses 7h
Dealer says lower
Before: 3c - 16.67 | Middle: 4c - 33.33 | After: 5c - 16.67
Prachi guesses 4c
Prachi guessed 4s correctly
Dealer (Peter) reveals 4s
--------------------------------------------------------------------------------
Before: 5c - 8.33 | Middle: 7h - 8.33 | After: 10s - 8.33
Kaz guesses 7h
Dealer says higher
Before: Jd - 33.33 | Middle: Qd - 33.33 | After: Ah - 16.67
Kaz guesses Qd
Dealer (Peter) reveals 10s
--------------------------------------------------------------------------------
Before: 5c - 9.09 | Middle: 7h - 9.09 | After: Jd - 18.18
Pooja guesses Jd
Dealer says lower
Before: 3c - 16.67 | Middle: 4c - 16.67 | After: 5c - 16.67
Pooja guesses 4c
Dealer (Peter) reveals 7h
--------------------------------------------------------------------------------
Before: 4c - 10.00 | Middle: 5c - 10.00 | After: Jd - 20.00
Prachi guesses Jd
Dealer says higher
Before: Qd - 66.67 | Middle: Ah - 33.33 | After: Ah - 33.33
Prachi guesses Qd
Prachi guessed Qh correctly
Dealer (Peter) reveals Qh
--------------------------------------------------------------------------------
Before: 4c - 11.11 | Middle: 5c - 11.11 | After: Jd - 22.22
Kaz guesses Jd
Dealer says lower
Before: 3c - 20.00 | Middle: 4c - 20.00 | After: 5c - 20.00
Kaz guesses 4c
Kaz guessed 4c correctly
Dealer (Peter) reveals 4c
--------------------------------------------------------------------------------
Before: 5c - 12.50 | Middle: Jd - 25.00 | After: Qd - 12.50
Pooja guesses Jd
Dealer says lower
Before: 2h - 50.00 | Middle: 3c - 25.00 | After: 5c - 25.00
Pooja guesses 2h
Dealer (Peter) reveals 3c
--------------------------------------------------------------------------------
Before: 5c - 14.29 | Middle: Jd - 28.57 | After: Qd - 14.29
Prachi guesses Jd
Dealer says lower
Before: 2h - 66.67 | Middle: 5c - 33.33 | After: 5c - 33.33
Prachi guesses 2h
Prachi guessed 2s correctly
Dealer (Peter) reveals 2s
--------------------------------------------------------------------------------
Before: 5c - 16.67 | Middle: Jd - 33.33 | After: Qd - 16.67
Kaz guesses Jd
Kaz guessed Jc correctly
Dealer (Peter) reveals Jc
--------------------------------------------------------------------------------
Before: 5c - 20.00 | Middle: Jd - 20.00 | After: Qd - 20.00
Pooja guesses Jd
Dealer says lower
Before: 2h - 50.00 | Middle: 5c - 50.00 | After: 5c - 50.00
Pooja guesses 5c
Pooja guessed 5c correctly
Dealer (Peter) reveals 5c
--------------------------------------------------------------------------------
Before: Jd - 25.00 | Middle: Qd - 25.00 | After: Ah - 25.00
Prachi guesses Qd
Dealer says lower
Before: 2h - 50.00 | Middle: Jd - 50.00 | After: Jd - 50.00
Prachi guesses Jd
Prachi guessed Jd correctly
Dealer (Peter) reveals Jd
--------------------------------------------------------------------------------
Before: 2h - 33.33 | Middle: Qd - 33.33 | After: Ah - 33.33
Kaz guesses Qd
Dealer says higher
Before: Ah - 100.00 | Middle: Ah - 100.00 | After: Ah - 100.00
Kaz guesses Ah
Kaz guessed Ah correctly
Dealer (Peter) reveals Ah
--------------------------------------------------------------------------------
Before: 2h - 50.00 | Middle: Qd - 50.00 | After: Qd - 50.00
Pooja guesses Qd
Pooja guessed Qd correctly
Dealer (Peter) reveals Qd
--------------------------------------------------------------------------------
Before: 2h - 100.00 | Middle: 2h - 100.00 | After: 2h - 100.00
Prachi guesses 2h
Prachi guessed 2h correctly
Dealer (Peter) reveals 2h
--------------------------------------------------------------------------------
Last dealer: Peter
Game over
```
