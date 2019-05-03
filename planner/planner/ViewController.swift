//
//  ViewController.swift
//  planner
//
//  Created by Nishant Arora on 4/24/19.
//  Copyright © 2019 Nishant Arora. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var assignmentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loadAssignmentView(_ sender: Any) {
        performSegue(withIdentifier: "toAssignmentView", sender: self)
    }
    
}

