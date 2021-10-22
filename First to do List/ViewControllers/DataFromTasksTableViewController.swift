//
//  DataFromTasksTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 2/1/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class DataFromTasksTableViewController: UITableViewController {
    
    @IBOutlet weak var titleOfTasks: UILabel!
    @IBOutlet weak var descriptionOfTasks: UILabel!
    @IBOutlet weak var sceduleOfTasks: UILabel!
    @IBOutlet weak var priorityOfTasks: UILabel!
    @IBOutlet weak var favoriteOfTasks: UILabel!
    @IBOutlet weak var statusOfTasks: UILabel!
    
    var dataFor : TasksStruct?
    var myModal = Modal()
    var folderIndex : Int?
    var taskIndex : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myTrue = true
        print("\(myTrue)", String(myTrue))
    
        let shareText = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addNewInfo))
        let editTask = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTaskData))
        navigationItem.rightBarButtonItems = [editTask, shareText]
        self.title = "Info"
        
    }
    func loadDataForModal() {
        if let folder = folderIndex,
           let index = taskIndex {
            titleOfTasks.text = toDoListData[folder].tasks[index].title
            descriptionOfTasks.text = toDoListData[folder].tasks[index].description
            sceduleOfTasks.text = toDoListData[folder].tasks[index].scedule
            favoriteOfTasks.text = String(toDoListData[folder].tasks[index].favorite)
            statusOfTasks.text = String(toDoListData[folder].tasks[index].done)
            priorityOfTasks.text = String(toDoListData[folder].tasks[index].priority)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        myModal.loadToDoList()
        loadDataForModal()

        self.title = toDoListData[folderIndex!].tasks[taskIndex!].title
        
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "13"))
        tableView.backgroundView?.contentMode = .scaleAspectFill
    }
    
    @objc func addNewInfo() {
        let share = "Share Text"
        let activity = UIActivityViewController(activityItems: [share], applicationActivities: nil)
        activity.popoverPresentationController?.sourceView = self.view
        self.present(activity, animated: true)
    }
    
    @objc func editTaskData() {
        if folderIndex != nil && taskIndex != nil {
            print(toDoListData[folderIndex!].tasks[taskIndex!])
            
            let gotoTasks = UIStoryboard(name: "Main", bundle: nil)
            if let openTasks =  gotoTasks.instantiateViewController(withIdentifier: "addtask") as? AddNewTaskTableViewController {
                openTasks.openType = "Edit"
                openTasks.folderIndex = self.folderIndex
                openTasks.taskIndex = self.taskIndex
                navigationController?.pushViewController(openTasks, animated: true)
            }
        } else {
            print("We couldn't find what you're looking for")
        }
    }
}



