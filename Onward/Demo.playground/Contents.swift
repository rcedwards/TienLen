//: Playground - noun: a place where people can play

import TienLen

//: Tiến lên - https://en.wikipedia.org/wiki/Tien_len

do {
    let myGame = try TienLen(numberOfPlayers: 2)
    myGame.validateCardOrder()
    for card in myGame.deck.cards {
        print(card)
    }
} catch {
    print("\(error)")
}
