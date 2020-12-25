//
//  Array+Only.swift
//  memorize2
//
//  Created by Seungmi Kang on 04/10/1399 AP.
//

import Foundation

extension Array {
    var only: Element? {
        self.count == 1 ? self.first : nil
    }
}
