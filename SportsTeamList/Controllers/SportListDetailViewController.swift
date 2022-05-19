//
//  SportListDetailViewController.swift
//  SportsTeamList
//
//  Created by Scott Cox on 5/14/22.
//

import UIKit

class SportListDetailViewController: UIViewController {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamRankLabel: UILabel!
    @IBOutlet weak var playerCountLabel: UILabel!
    @IBOutlet weak var teamNameTextField: UITextField!
    @IBOutlet weak var teamRankTextField: UITextField!
    @IBOutlet weak var playerCountTextField: UITextField!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    var teamReceiver: Team?
    
  
    
    func updateViews() {
        guard let team = teamReceiver else {return}
        teamNameTextField.text = team.name
        playerCountTextField.text = String(team.playerCount)
        teamRankTextField.text = String(team.rank)
    }
    
    func resetViews() {
        teamNameTextField.text = ""
        playerCountTextField.text = ""
        teamRankTextField.text = ""
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        resetViews()
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = teamNameTextField.text,
        let playerCount = playerCountTextField.text,
        let rank = teamRankTextField.text else {return}
        if let team = teamReceiver {
            // Update
            TeamController.sharedInstance.update(teamtoUpdate: team, name: name, playerCount: Int(playerCount) ?? 0, rank: Int(rank) ?? 0)
        } else {
            // Create
            TeamController.sharedInstance.createTeam(name: name, playerCount: Int(playerCount) ?? 0, rank: Int(rank) ?? 0)
        }
        navigationController?.popViewController(animated: true)
    }
} // End of Class

