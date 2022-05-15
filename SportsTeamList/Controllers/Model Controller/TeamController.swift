//
//  TeamController.swift
//  SportsTeamList
//
//  Created by Scott Cox on 5/15/22.
//

import Foundation

class TeamController {
    
    // MARK: - Singleton
    static let sharedInstance = TeamController()

    var teams: [Team] = []

    func createTeam(name: String, playerCount: Int, rank: Int) {
        let team = Team(name: name, playerCount: playerCount, rank: rank)
        teams.append(team)
    }
    
    func update() {
        
    }
    
    func delete() {
        
    }
    
    
    

} // End of Class
