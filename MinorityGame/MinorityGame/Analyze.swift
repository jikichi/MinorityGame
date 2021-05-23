//
//  Analyze.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/17.
//

import Foundation

class Analyze {
    var minorityGame: MinorityGame
    
    init(N: Int, m: Int, s: Int, times: Int, dependency: [StrategyModelProtocol]) {
        let minoritygame = MinorityGame(N: N, m: m, s: s, dependency: dependency)
        self.minorityGame = minoritygame
        
        minoritygame.playGame(times: times)
    }
    
    public func anaryze() {
        let result: [String] = [minorityGame.getAgentsRankingArray().description]
        print(result.joined(separator: ","))
    }
}
