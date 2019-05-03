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
        assignments = addItem()
    }

    func addItem() -> [Assignment] {
        let eggs = Assignment()
        eggs.name = "buy eggs"
        eggs.important = true
        
        let dogs = Assignment()
        dogs.name = "walk dogs"
        
        let cheese = Assignment()
        cheese.name = "eat cheese"

        return [eggs, dogs, cheese]
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
            cell.textLabel?.textColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
        }
        
        return cell
    }
}
