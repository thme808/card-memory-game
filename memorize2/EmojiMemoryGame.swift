//
//  EmojiMemoryGame.swift
//  memorize2
//
//  Created by Seungmi Kang on 30/09/1399 AP.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    //@Published:  this property wrapper means that everytime there's changes made to model trigger function objectWillChange.send()
    //so that the view is reactive
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    private static func createMemoryGame () -> MemoryGame<String>{
        let emojis = ["🐹", "🐔", "🐱", "🐧","🐼","🦉","🐌","🪰"]
        return MemoryGame(numberOfPairsOfCards: 3, cardContentFactory: { pairIndex in return emojis[pairIndex] })
    }
    
    //MARK: - access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
