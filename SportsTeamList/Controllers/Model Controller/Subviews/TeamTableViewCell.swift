//
//  TeamTableViewCell.swift
//  SportsTeamList
//
//  Created by Scott Cox on 5/15/22.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerCountLabel: UILabel!
    @IBOutlet weak var teamRankLabel: UILabel!
    
    func updateViews(for team: Team) {
        teamNameLabel.text = team.name
        playerCountLabel.text = String(team.playerCount)
        teamRankLabel.text = String(team.rank)
    }
}
