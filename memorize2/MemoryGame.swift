//
//  MemoryGame.swift
//  memorize2
//
//  Created by Seungmi Kang on 30/09/1399 AP.
//

import Foundation


struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    var indexOfFaceUpCard: Int? {
        get { cards.indices.filter{ index -> Bool in cards[index].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    mutating func choose (card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card)
           , !cards[chosenIndex].isFaceUp
           , !cards[chosenIndex].isMatched {
                        
            if let faceUpCardIndex = indexOfFaceUpCard {
                if(cards[chosenIndex].content == cards[faceUpCardIndex].content){
                    print("matched")
                    cards[chosenIndex].isMatched = true
                    cards[faceUpCardIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true

            }else{
                indexOfFaceUpCard = chosenIndex
            }
        }
    }
    
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
