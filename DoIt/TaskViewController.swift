//
//  TaskViewController.swift
//  DoIt
//
//  Created by Son Nguyen on 1/8/17.
//  Copyright © 2017 Son Nguyen. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    // How many rows are there
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.impportant {
            cell.textLabel?.text = "🇺🇸\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func makeTasks() -> [Task] {
        
        let task1 =  Task()
        task1.name = "Walk the dog"
        task1.impportant = false
        
        let task2 =  Task()
        task2.name = "Walk the cat"
        task2.impportant = true
        
        let task3 =  Task()
        task3.name = "Walk the bird"
        task3.impportant = false
        
        return [task1, task2, task3]
    }
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
}

