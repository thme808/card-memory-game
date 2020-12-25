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
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture(perform: {
                viewModel.choose(card: card)
            })
            .padding(5)
        }
        
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
    
    private func body(for size: CGSize) -> some View {
        ZStack(content: {
            if(card.isFaceUp){
                RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.orange, lineWidth: lineWidth)
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(350-90), clockWise: true)
                    .padding(5).opacity(0.5)
                Text(card.content)
            }else{
                if(!card.isMatched){
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.yellow)
                }
            }
            
        })
        .font(Font.system(size: fontSize(for: size)))
    }
    
    private let cornerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 5.0
    private let fontScaleFactor: CGFloat = 0.75
    
    private func fontSize (for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}





