//
//  StrategyModel+Random.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/19.
//

import Foundation
import GameplayKit

private let gaussian2 = GKGaussianDistribution(randomSource: GKMersenneTwisterRandomSource(seed: UInt64(seed)), lowestValue: 0, highestValue: 1)

private let gaussianM = GKGaussianDistribution(randomSource: GKMersenneTwisterRandomSource(seed: UInt64(seed)), lowestValue: 0, highestValue: m - 1)
private let gaussianM2 = GKGaussianDistribution(randomSource: GKMersenneTwisterRandomSource(seed: UInt64(seed)), lowestValue: 0, highestValue: Int(pow(Double(2), pow(Double(2), Double(m)))) - 1)

public func randomValue() -> Int {
    return gaussian2.nextInt()
}
public func randomHistory(m: Int) -> String {
    var randomString = ""
    for _ in 0 ..< m {
        randomString += String(randomValue())
    }
    return randomString
}
public func randomM() -> Int {
    return gaussianM.nextInt()
}
public func randomM2(s: Int) -> [Int] {
    var intSetArray: Set<Int> = []
    var intArray: [Int] = []
    while intSetArray.count != s {
        intSetArray.insert(gaussianM2.nextInt())
    }
    for i in intSetArray {
        intArray.append(i)
    }
    return intArray
}
