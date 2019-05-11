//  ViewController.swift
//  Copyright © 2019 Nishant Arora. All rights reserved.

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var assignmentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loadAssignmentView(_ sender: Any) {
        performSegue(withIdentifier: "toAssignmentView", sender: self)
    }
    
}

