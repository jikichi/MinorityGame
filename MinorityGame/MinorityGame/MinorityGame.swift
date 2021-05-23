//
//  MinorityGame.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/17.
//

import Foundation

protocol MinorityGameAnalyzeProtocol {
    func getAgentsRankingArray() -> Array<Int>
}

class MinorityGame: MinorityGameAnalyzeProtocol {
    func getAgentsRankingArray() -> Array<Int> {
        var array = [Int]()
        for i in 0 ..< N {
            array.append(agents[i].winCount)
        }
        return array.sorted(by: {(a, b) in
            return a > b
        })
    }
    
    var agents: [Agent]
    var N: Int
    
    init(N: Int, m: Int, s: Int, dependency: [StrategyModelProtocol]) {
        var agents: [Agent] = []
        self.N = N
        for i in 0 ..< N {
            let agent = Agent(id: UInt64(i), m: m, s: s, dependency: dependency[i])
            agents.append(agent)
        }
        self.agents = agents
    }
    
    public func playGame(times: Int) {
        
        for _ in 0 ..< times {
            let winner = self.judge()
            self.updateAgents(winner: winner)
        }
    }
    
    private func updateAgents(winner: String) {
        for i in 0 ..< N {
            agents[i].update(winner: winner)
        }
    }
    
    private func judge() -> String {
        var count0 = 0
        var count1 = 0
        for i in 0 ..< agents.count {
            count0 = agents[i].nextValue == 0 ? count0 + 1 : count0
            count1 = agents[i].nextValue == 1 ? count1 + 1 : count1
        }
        return count0 < count1 ? "0" : "1"
    }
}
