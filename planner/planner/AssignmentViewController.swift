//
//  AssignmentViewController.swift
//  planner
//
//  Created by Nishant Arora on 5/3/19.
//  Copyright © 2019 Nishant Arora. All rights reserved.
//

import UIKit

class AssignmentViewController: UITableViewController {
    var assignments: [Assignment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return assignments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let assignment = assignments[indexPath.row]
        
        cell.textLabel?.text = assignment.name

        if assignment.important {
            cell.textLabel?.textColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            // UIColor(red: 0.4, green: 0.82, blue: 0.4, alpha: 1.0)
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addAssignmentVC = segue.destination as? AddAssignmentViewController {
            addAssignmentVC.assignmentVC = self
        }
        
        if let removeAssignmentVC = segue.destination as? RemoveAssignmentViewController {
            if let assignment = sender as? Assignment {
                removeAssignmentVC.selectedAssignment = assignment
                removeAssignmentVC.assignmentVC = self
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let assignment = assignments[indexPath.row]
        performSegue(withIdentifier: "goToRemove", sender: assignment)
    }
}
