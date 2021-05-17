//
//  StrategyModel.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/17.
//

import Foundation

protocol StrategyTablePublicValue {
    mutating func getNextValue() -> Int
    mutating func evaluationStrategy(win: Bool, result: String) -> Void
}

struct StrategyTable: StrategyTablePublicValue {
    var point: [Int] // [0, 1]
//    var table: [String] // ["001", "010"]
    let selectedStrategy: [String] // [00000001, 00000101, 11111111]
    var history: String
    var selectedTable: Int
    var selectedStrategyIndex: Int
    
    init(m: Int, s: Int) {
//        var table: [String] = []
        self.point = []
        for _ in 0 ..< s {
            self.point.append(0)
        }
        
        let tableValues: [Int] = Array(0 ..< Int(pow(Double(2), (pow(Double(2), Double(m)))))).shuffled()
        
        var stringTables = tableValues.prefix(s).map { String($0, radix: 2) }
        let historyLenght = Int(pow(Double(2), Double(m)))
        for i in 0 ..< stringTables.count {
            while (historyLenght !=  stringTables[i].count) {
                stringTables[i] = "0" + stringTables[i]
                
            }
        }
        self.selectedStrategy = stringTables
        
//        for i in 0 ..< Int(pow(Double(2), Double(m))) {
//            var value = String(i, radix: 2)
//            while value.count != m {
//                value = "0" + value
//            }
//            table.append(value)
//        }
//        self.table = table
        
        let randomValue: [Int] = Array(0 ..< Int(pow(Double(2), Double(m)))).shuffled().prefix(1).map { $0 }
        
        self.history = String(randomValue[0], radix: 2)
        
        let selectedStringIndex = Int(history, radix: 2)!
        self.selectedTable = 0
        self.selectedStrategyIndex = selectedStringIndex
        
    }
    
    mutating func getNextValue() -> Int {
        return _getNextValue()
    }
    
    private func _getNextValue() -> Int {
        guard let nextValueChar =  selectedStrategy[self.selectedTable].characterAtIndex(index: self.selectedStrategyIndex) else { fatalError() }
        return Int(String(nextValueChar))!
    }
    
    
    mutating func evaluationStrategy(win: Bool, result: String) {
        evaluate(win: win)
        updateHistry(winner: result)
        setNextValue()
    }
    
    private mutating func evaluate(win: Bool) {
        if win {
            point[selectedTable] = point[selectedTable] + 1
            
        } else {
            point[selectedTable] = point[selectedTable] - 1
        }
    }
    
    private mutating func updateHistry(winner: String) {
        let newHistory = self.history.dropFirst(1) + winner
        self.history = String(newHistory)
    }
    
    private mutating func setNextValue() {
        var max = -1000000000
        var maxIndex = 0
        for (i, value) in point.enumerated() {
            if value > max {
                max = value
                maxIndex = i
            }
        }
        selectedTable = maxIndex
        selectedStrategyIndex = Int(history, radix: 2)!
    }
}
