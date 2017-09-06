//: Playground - noun: a place where people can play

import UIKit



struct Card {
    var Color: String
    var Roll: Int
}

class Deck {
    var cards: [Card] = []
    
    init() {
        for _ in 1...10{
            cards.append(Card(Color: "Blue", Roll: Int(arc4random_uniform(2)+1)))
            cards.append(Card(Color: "Red", Roll: Int(arc4random_uniform(2)+3)))
            cards.append(Card(Color: "Green", Roll: Int(arc4random_uniform(2)+5)))
        }
    }
    
    func deal() -> Card {
        return cards.remove(at: 0)
    }
    
    func isEmpty() -> Bool {
//        if cards.count == 0{
//            return true
//        }
//        else{
//            return false
        //}
        return cards.count == 0
        
    }
    
    func shuffle() {
        for _ in  0...30{
            let random1: Int = Int(arc4random_uniform(UInt32(cards.count)))
            let random2: Int = Int(arc4random_uniform(UInt32(cards.count)))
            let temp: Card = cards[random1]
            cards[random1] = cards[random2]
            cards[random2] = temp
        }
        
    }
}

class Player: Deck {
    var name: String
    var hand: [Card] = []
    
    init(name: String){
        self.name = name
    }
    func draw(deck: Deck) -> Card {
        let playerCard = deck.deal()
        hand.append(playerCard)
        return playerCard
    }
    func rollDice() -> Int{
        return Int(arc4random_uniform((6)+1))
    }
    func matchingCards(color: String, roll: Int) ->Int{
        var count = 0
        for card in hand{
            if color == card.Color && roll == card.Roll{
                count += 1
                print (count)
                
            }
        }
        return count
    }
}


var person = Player(name: "rico")
person.rollDice()
person.shuffle()
print (person.cards)
//var deck: Deck = Deck()
//deck.shuffle()
//print (deck.cards)
//
//
//deck.isEmpty()
//
//deck.deal()
//
//print (deck.cards)






