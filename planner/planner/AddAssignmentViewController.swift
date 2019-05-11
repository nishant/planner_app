//
//  AddAssignmentViewController.swift
//  planner
//
//  Created by Nishant Arora on 5/3/19.
//  Copyright © 2019 Nishant Arora. All rights reserved.
//

import UIKit


class AddAssignmentViewController: UIViewController {
    var assignmentVC = AssignmentViewController()

    @IBOutlet weak var assignmentNameField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addButtonWasTapped(_ sender: Any) {
        addAssignment()
    }
    
    func addAssignment() {
        let assignment = Assignment()
        
        if let name = assignmentNameField.text {
            assignment.name = name
            assignment.important = importantSwitch.isOn
            
            assignmentVC.assignments.append(assignment)
            assignmentVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
    }
}
