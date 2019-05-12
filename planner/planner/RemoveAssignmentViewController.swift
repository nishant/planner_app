//  RemoveAssignmentViewController.swift
//  Copyright © 2019 Nishant Arora. All rights reserved.

import UIKit

class RemoveAssignmentViewController: UIViewController {
    var assignmentVC = AssignmentViewController()
    var selectedAssignment: AssignmentCoreData?
    var nightModeStatus = UserDefaults.standard.bool(forKey: "nightModeOn")

    @IBOutlet weak var assignmentName: UILabel!
    
    override func viewDidLoad() {
        if nightModeStatus {
            assignmentName.textColor = UIColor .white
            self.view.backgroundColor = UIColor .black
        } else {
            assignmentName.textColor = UIColor .black
            self.view.backgroundColor = UIColor(red: 90/255, green: 210/255, blue: 255/255, alpha: 1)
        }
        assignmentName.text = selectedAssignment?.name
        super.viewDidLoad()
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
