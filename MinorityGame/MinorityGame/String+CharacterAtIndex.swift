//
//  String+CharacterAtIndex.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/17.
//

import Foundation

extension String {
    func characterAtIndex(index: Int) -> Character? {
        for (cur, char) in enumerated() {
            if cur == index {
                print(self)
                return char
            }
        }
        return nil
    }
}
