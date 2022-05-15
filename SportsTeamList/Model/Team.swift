//
//  Team.swift
//  SportsTeamList
//
//  Created by Scott Cox on 5/15/22.
//

import Foundation

class Team {
    var name: String
    var playerCount: Int
    var rank: Int
    
    init(name: String, playerCount: Int, rank: Int) {
    self.name = name
    self.playerCount = playerCount
    self.rank = rank
    }
} // End of Class
