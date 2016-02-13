//: Playground - noun: a place where people can play

import TienLen

//: Tiến lên - https://en.wikipedia.org/wiki/Tien_len

let deck = Deck()
for card in deck.cards {
    print(card)
}

let aceOfSpades = TienLenCard(rank: .Ace, suit: .Spade)
let twoOfHearts = TienLenCard(rank: .Two, suit: .Heart)
if aceOfSpades < twoOfHearts {
    print("Correct")
}

let myGame = TienLen(deck: deck)
myGame.validateCardOrder()


