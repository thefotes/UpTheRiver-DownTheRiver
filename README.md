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
