//
//  StrategyModel+Random.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/19.
//

import Foundation
import GameplayKit

class Random {
    private let gaussian2: GKGaussianDistribution
    private let gaussianM: GKGaussianDistribution
    private let gaussianM2: GKGaussianDistribution
    private let gaussianS: GKGaussianDistribution
    
    init(seed: Int, m: Int, s: Int) {
        let gaussian2 = GKGaussianDistribution(randomSource: GKMersenneTwisterRandomSource(seed: UInt64(seed)), lowestValue: 0, highestValue: 1)
        
        let gaussianM = GKGaussianDistribution(randomSource: GKMersenneTwisterRandomSource(seed: UInt64(seed)), lowestValue: 0, highestValue: m - 1)
        let gaussianM2 = GKGaussianDistribution(randomSource: GKMersenneTwisterRandomSource(seed: UInt64(seed)), lowestValue: 0, highestValue: Int(pow(Double(2), pow(Double(2), Double(m)))) - 1)
        let gaussianS = GKGaussianDistribution(randomSource: GKMersenneTwisterRandomSource(seed: UInt64(seed)), lowestValue: 0, highestValue: s - 1)
        self.gaussian2 = gaussian2
        self.gaussianM = gaussianM
        self.gaussianM2 = gaussianM2
        self.gaussianS = gaussianS
    }
    
    public func randomValue() -> Int {
        return abs(gaussian2.nextInt())
    }
    public func randomHistory(m: Int) -> String {
        var randomString = ""
        for _ in 0 ..< m {
            randomString += String(randomValue())
        }
        return randomString
    }
    public func randomM() -> Int {
        return abs(gaussianM.nextInt())
    }
    public func randomS() -> Int {
        return abs(gaussianS.nextInt())
    }
    public func randomM2(s: Int) -> [Int] {
        var intSetArray: Set<Int> = []
        var intArray: [Int] = []
        while intSetArray.count != s {
            intSetArray.insert(abs(gaussianM2.nextInt()))
        }
        for i in intSetArray {
            intArray.append(i)
        }
        return intArray
    }
}
