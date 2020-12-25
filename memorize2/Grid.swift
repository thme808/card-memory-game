//
//  Grid.swift
//  memorize2
//
//  Created by Seungmi Kang on 01/10/1399 AP.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        })
    }
    
    private func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            body(for:item, in:layout)
        }
    }
    
    private func body(for item: Item, in layout: GridLayout) -> some View{
        let index = items.firstIndex(matching: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .position(layout.location(ofItemAt: index))
    }
}


//
//
//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}





