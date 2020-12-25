//
//  Array+Idenfiable.swift
//  memorize2
//
//  Created by Seungmi Kang on 02/10/1399 AP.
//

import Foundation

extension Array where Element :Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if(matching.id == self[index].id) {
                return index
            }
        }
        //TODO: bogus!
        return nil
        
        
        /*
         Optional
         : is junt an enum
         
         enum Optional<T> {
            case none
            case some(T)
         }
         */
    }
}
