//  AddAssignmentViewController.swift
//  Copyright © 2019 Nishant Arora. All rights reserved.

import UIKit

class AddAssignmentViewController: UIViewController {
    var assignmentVC = AssignmentViewController()

    @IBOutlet weak var assignmentNameField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonWasTapped(_ sender: Any) {
        addAssignment()
    }
    
    func addAssignment() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let assignment = AssignmentCoreData.init(entity: AssignmentCoreData.entity(), insertInto: context)
    
            if assignmentNameField.text == "" {
                let alert = UIAlertController(title: "Invalid Name", message: "The name field cannot be left blank.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            if let name = assignmentNameField.text {
                assignment.name = name
                assignment.important = importantSwitch.isOn
            }
            
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
    }
}
