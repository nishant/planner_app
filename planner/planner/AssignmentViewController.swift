//  AssignmentViewController.swift
//  Copyright © 2019 Nishant Arora. All rights reserved.

import UIKit

class AssignmentViewController: UITableViewController {
    var assignments: [AssignmentCoreData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAssignments()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return assignments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let assignment = assignments[indexPath.row]
        
        if let name = assignment.name {
            cell.textLabel?.text = name
            
            if assignment.important {
                cell.textLabel?.textColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                // UIColor(red: 0.4, green: 0.82, blue: 0.4, alpha: 1.0)
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addAssignmentVC = segue.destination as? AddAssignmentViewController {
            addAssignmentVC.assignmentVC = self
        }
        
        if let removeAssignmentVC = segue.destination as? RemoveAssignmentViewController {
            if let assignment = sender as? AssignmentCoreData {
                removeAssignmentVC.selectedAssignment = assignment
                removeAssignmentVC.assignmentVC = self
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let assignment = assignments[indexPath.row]
        performSegue(withIdentifier: "goToRemove", sender: assignment)
    }
    
    func getAssignments() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataAssignments = try? context.fetch(AssignmentCoreData.fetchRequest()) as? [AssignmentCoreData] {
                if let assignmentsCoreData = coreDataAssignments {
                    assignments = assignmentsCoreData
                    tableView.reloadData()
                }
            }
        }
    }
}
