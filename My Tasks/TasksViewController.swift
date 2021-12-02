//
//  TaskTableViewController.swift
//  My Tasks
//
//  Created by Rodrigo Rodrigues on 23/11/21.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tasks: [String] = []
    
    @IBOutlet weak var tbListCar: UITableView!
    
    //-----------------------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------------------
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadTasks()
    }
    
    //-----------------------------------------------------------------------------------
    //  MARK: - Table view data source
    //-----------------------------------------------------------------------------------
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskReuse", for: indexPath)
        
        cell.textLabel?.text = tasks[ indexPath.row ]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle:
                   UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let task = TaskManager()
            task.remove(indice: indexPath.row)
            loadTasks()
        }
    }
    
    func loadTasks(){
        let task = TaskManager()
        tasks = task.list()
        tbListCar.reloadData()
    }
}
