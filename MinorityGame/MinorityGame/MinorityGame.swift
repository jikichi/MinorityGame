//
//  MinorityGame.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/17.
//

import Foundation

class MinorityGame {
    var agents: [Agent]
    var N: Int
    
    init(N: Int, m: Int, s: Int) {
        var agents: [Agent] = []
        self.N = N
        for i in 0 ..< N {
            var agent = Agent(id: UInt64(i), m: m, s: s)
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
