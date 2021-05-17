//
//  model.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/15.
//

import Foundation

// Dependencies
protocol AgentPublicValues {
    mutating func update(winner: String) -> Void
}

struct Agent: AgentPublicValues, Identifiable {
    
    mutating func update(winner: String) {
        updateAgent(winner: winner)
    }
    
    let id: UInt64
    var winCount: Int
    var nextValue: Int
    var strategyTable: StrategyTable // strategyTables[0].table => ["001", "010"]
    
    init(id: UInt64, m: Int, s: Int) {
        self.id = id
        self.winCount = 0
        self.strategyTable = StrategyTable.init(m: m, s: s)
        self.nextValue = strategyTable.getNextValue()
    }
    
    private mutating func updateAgent(winner: String) {
        let win = winner == String(nextValue) ? true : false
        if win {
            self.winCount = winCount + 1
        }
        strategyTable.evaluationStrategy(win: win, result: winner)
        
        self.nextValue = strategyTable.getNextValue()
    }
}

