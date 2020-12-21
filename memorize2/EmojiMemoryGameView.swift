//
//  EmojiMemoryGameView.swift
//  memorize2
//
//  Created by Seungmi Kang on 30/09/1399 AP.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //@ObservedObject: this property wrapper means view need to redraw when function objectWillChange.send() is called
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        return HStack(content: {
            ForEach(viewModel.cards, content: {card in
                CardView(card: card).onTapGesture(perform: {
                    viewModel.choose(card: card)
                })
            })
        })
        .foregroundColor(Color.red)
        .padding()
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        return GeometryReader(content: { geometry in
            body(for: geometry.size)
        })
    }
    
    func body(for size: CGSize) -> some View {
        ZStack(content: {
            if(card.isFaceUp){
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 5.0)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(Color.white)
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).fill(Color.blue)
            }
            
        })
        .font(Font.system(size: fontSize(for: size)))
    }
    
    let cornerRadius: CGFloat = 25.0
    let lineWidth: CGFloat = 5.0
    let fontScaleFactor: CGFloat = 0.8
    
    func fontSize (for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
    }
}



