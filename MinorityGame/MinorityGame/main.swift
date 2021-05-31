//
//  main.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/15.
//

import Foundation

private let N = 201
private let m = 5
private let s = 2
private let seed = 0
private let times = 1000000

let random = Random(seed: seed, m: m, s: s)

var strategyTables: [StrategyModelProtocol] = []
var randomStrategyTables: [StrategyModelProtocol] = []

for _ in 0 ..< N {
    strategyTables.append(StrategyTable.init(m: m, s: s))
}

for _ in 0 ..< N {
    randomStrategyTables.append(RandomStrategy())
}

let analyze = Analyze(N: N, m: m, s: s, times: times, dependency: strategyTables)
analyze.anaryze()

print("the end")

