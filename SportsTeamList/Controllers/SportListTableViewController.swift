//
//  SportListTableViewController.swift
//  SportsTeamList
//
//  Created by Scott Cox on 5/14/22.
//

import UIKit

class SportListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TeamController.sharedInstance.teams.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "teamInfoCell", for: indexPath) as? TeamTableViewCell else {return UITableViewCell() }
        let teamEntry = TeamController.sharedInstance.teams[indexPath.row]
        cell.updateViews(for: teamEntry)
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let teamToDelete = TeamController.sharedInstance.teams[indexPath.row]; TeamController.sharedInstance.delete(teamToDelete: teamToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? SportListDetailViewController {
                    let teamToPass = TeamController.sharedInstance.teams[index.row]
                    destination.teamReceiver = teamToPass
                }
            }
        }
    }
    
    
} // End of class

