//
//  RandomStrategy.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/20.
//

import Foundation


struct RandomStrategy: StrategyModelProtocol {
    var nextValue: Int
    mutating func getNextValue() -> Int {
        return nextValue
    }
    
    mutating func evaluationStrategy(win: Bool, result: String) {
        self.nextValue = random.randomValue()
        
    }
    init() {
        self.nextValue = random.randomValue()
    }
    
}




