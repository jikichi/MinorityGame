//
//  main.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/15.
//

import Foundation

let N = 1001
let m = 3
let s = 2

let minoritygame = MinorityGame(N: N, m: m, s: s)
minoritygame.playGame(times: 10000)
print("the end")

