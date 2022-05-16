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
    }
    
    var teamReceiver: Team?
    
    func updateViews(team: Team?) {
        guard let team = team else {return}
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
        resetView()
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    
    

    
    // MARK: - Navigation

 

} // End of Class

