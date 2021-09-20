//
//  ArrayExtension.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 20.09.2021.
//

import Foundation

extension Array {
    mutating func removeRandom() -> Element? {
        if let index = indices.randomElement() {
            return remove(at: index)
        }
        return nil
    }
}

extension Array where Element == String {
    func returnEnumerationString() -> String {
        let stringArray2 = self.map { String($0) }
        let string = stringArray2.joined(separator: ", ")
        
        return string
    }
}
