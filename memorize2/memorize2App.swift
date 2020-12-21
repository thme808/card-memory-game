//
//  memorize2App.swift
//  memorize2
//
//  Created by Seungmi Kang on 30/09/1399 AP.
//

import SwiftUI

@main
struct memorize2App: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}





