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
    
    // MARK: - Collection
    private(set) var teams: [Team] = []
    
    init() {
        load()
    }
    
    private var teamsURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = documentsDirectory.appendingPathComponent("messages.json")
        return url
    }
    
    // MARK: - CRUD functions
    func createTeam(name: String, playerCount: Int, rank: Int) {
        let team = Team(name: name, playerCount: playerCount, rank: rank)
        teams.append(team)
        save()
    }
    
    func update(teamtoUpdate: Team, name: String, playerCount: Int, rank: Int) {
        teamtoUpdate.name = name
        teamtoUpdate.playerCount = playerCount
        teamtoUpdate.rank = rank
        save()
    }
    
    func delete(teamToDelete: Team) {
        guard let index = teams.firstIndex(of: teamToDelete) else {return}
        teams.remove(at: index)
        save()
    }
    
    // MARK: - Persistence
    func save() {
        guard let url = teamsURL else { return }
        do {
            let jsonData = try JSONEncoder().encode(teams)
            try jsonData.write(to: url)
        } catch {
            print("Error saving the team!")
        }
    }
    func load() {
        guard let teamsURL = teamsURL else { return }
        do {
            let data = try Data(contentsOf: teamsURL)
            let teams = try JSONDecoder().decode([Team].self, from: data)
            self.teams = teams
        } catch {
            print("Error loading team")
        }
    }
    
} // End of Class
