//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Son Nguyen on 1/11/17.
//  Copyright © 2017 Son Nguyen. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var completeTask: UIButton!
    @IBOutlet weak var taskLabel: UILabel!
    
    var previousVC = TaskViewController()
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taskLabel.text = task!.name
        
        if task!.important {
            taskLabel.text = "🇺🇸\(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
        
    }
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)

    }
    
}
