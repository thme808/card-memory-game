//
//  MemoryGame.swift
//  memorize2
//
//  Created by Seungmi Kang on 30/09/1399 AP.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    mutating func choose (card: Card) {
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        print("you chose \(card)")
    }
    
    func index (of card: Card) -> Int {
        for index in 0..<cards.count {
            if(cards[index].id == card.id){
                return index
            }
        }
        return 0 //TODO: bogus!
    }
    
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
