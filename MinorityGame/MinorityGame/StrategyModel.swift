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
    var selectedTableIndex: Int
    var selectedStrategyIndex: Int
    
    init(m: Int, s: Int) {
        self.point = []
        for _ in 0 ..< s {
            self.point.append(0)
        }
        
        var tableValues: [String] = randomM2(s: s).map { String($0, radix: 2) }
        
//        var stringTables = tableValues.prefix(s).map { String($0, radix: 2) }
        let historyLenght = Int(pow(Double(2), Double(m)))
        for i in 0 ..< tableValues.count {
            while (historyLenght !=  tableValues[i].count) {
                tableValues[i] = "0" + tableValues[i]
                
            }
        }
        self.selectedStrategy = tableValues
        
        self.selectedTableIndex = randomM()
        
        self.history = randomHistory(m: m)
        
        let selectedStringIndex = Int(history, radix: 2)!
        self.selectedStrategyIndex = selectedStringIndex
        
    }
    
    mutating func getNextValue() -> Int {
        return _getNextValue()
    }
    
    private func _getNextValue() -> Int {
        guard let nextValueChar =  selectedStrategy[self.selectedTableIndex].characterAtIndex(index: self.selectedStrategyIndex) else { fatalError() }
        return Int(String(nextValueChar))!
    }
    
    
    mutating func evaluationStrategy(win: Bool, result: String) {
        evaluate(win: win)
        updateHistry(winner: result)
        setNextValue()
    }
    
    private mutating func evaluate(win: Bool) {
        if win {
            point[selectedTableIndex] = point[selectedTableIndex] + 1
            
        } else {
            point[selectedTableIndex] = point[selectedTableIndex] - 1
        }
    }
    
    private mutating func updateHistry(winner: String) {
        let newHistory = self.history.dropFirst(1) + winner
        self.history = String(newHistory)
    }
    
    private mutating func setNextValue() {
        var maxValue = point[0]
        var maxIndex = 0
        for (i, value) in point.enumerated() {
            if value > maxValue {
                maxValue = value
                maxIndex = i
            }
        }
        selectedTableIndex = maxIndex
        selectedStrategyIndex = Int(history, radix: 2)!
    }
}
