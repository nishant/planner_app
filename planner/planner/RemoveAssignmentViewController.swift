//
//  RemoveAssignmentViewController.swift
//  planner
//
//  Created by Nishant Arora on 5/11/19.
//  Copyright © 2019 Nishant Arora. All rights reserved.
//

import UIKit

class RemoveAssignmentViewController: UIViewController {
    var assignmentVC = AssignmentViewController()
    var selectedAssignment = Assignment()
    
    @IBOutlet weak var assignmentName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignmentName.text = selectedAssignment.name
    }
    
    
    @IBAction func removeButtonWasTapped(_ sender: Any) {
        removeAssignment()
    }
    
    func removeAssignment() {
        assignmentVC.assignments.remove(at: getAssignmentIndex())
        assignmentVC.tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
    }
    
    func getAssignmentIndex() -> Int {
        var idx = 0
        
        for assignment in assignmentVC.assignments {
            if assignment.name == selectedAssignment.name {
                return idx
            }
            idx += 1
        }
        return -1
    }
}
