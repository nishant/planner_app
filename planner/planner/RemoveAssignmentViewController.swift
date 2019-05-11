//  RemoveAssignmentViewController.swift
//  Copyright © 2019 Nishant Arora. All rights reserved.

import UIKit

class RemoveAssignmentViewController: UIViewController {
    var assignmentVC = AssignmentViewController()
    var selectedAssignment: AssignmentCoreData?
    
    @IBOutlet weak var assignmentName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignmentName.text = selectedAssignment?.name
    }
    
    @IBAction func removeButtonWasTapped(_ sender: Any) {
        removeAssignment()
    }
    
    func removeAssignment() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDelete = selectedAssignment {
                context.delete(toDelete)
                try? context.save()
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
