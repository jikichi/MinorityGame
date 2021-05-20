//
//  main.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/15.
//

import Foundation

let N = 201
let m = 3
let s = 3
let seed = 100

let analyze = Analyze(N: N, m: m, s: s, times: 1000000)
analyze.anaryze()
let table = StrategyTable(m: 3, s: 2)
randomValue()
print("the end")

for _ in 0 ..< 100 {
    print(randomM2(s: s))
}


