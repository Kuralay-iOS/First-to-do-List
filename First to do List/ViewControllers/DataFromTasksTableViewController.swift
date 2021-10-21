//
//  DataFromTasksTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 2/1/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class DataFromTasksTableViewController: UITableViewController {
    
    @IBOutlet weak var titleDataTasksLB: UILabel!
    
    @IBOutlet weak var descriptionDataTasksLB: UILabel!
    
    @IBOutlet weak var sceduleDataTasksLB: UILabel!
    
    @IBOutlet weak var priorityDataTasksLB: UILabel!
    
    @IBOutlet weak var favoriteDataTasksLB: UILabel!
    
    @IBOutlet weak var statusDataTasksLB: UILabel!
    
    
    var dataFor : TasksStruct?
    
    var myModal = Modal()
    
    var folderIndex : Int?
    var taskIndex : Int?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myTrue = true
        print("\(myTrue)", String(myTrue))
        
        
        
        
        let shareTextButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addNewInfo))
        
        
        let editTaskButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTaskData))
        
        
        
        navigationItem.rightBarButtonItems = [editTaskButton, shareTextButton]
        
        
        self.title = "Info"
        
        
        
    }
    
    
    func loadDataForModal() {
        
        if let folder = folderIndex, let index = taskIndex {
            titleDataTasksLB.text = toDoListData[folder].tasks[index].title
            descriptionDataTasksLB.text = toDoListData[folder].tasks[index].description
            sceduleDataTasksLB.text = toDoListData[folder].tasks[index].scedule
            favoriteDataTasksLB.text = String(toDoListData[folder].tasks[index].favorite)
            statusDataTasksLB.text = String(toDoListData[folder].tasks[index].done)
            priorityDataTasksLB.text = String(toDoListData[folder].tasks[index].priority)
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
        
        let shareDT = "Share Text"
        let activityDT = UIActivityViewController(activityItems: [shareDT], applicationActivities: nil)
        activityDT.popoverPresentationController?.sourceView = self.view
        self.present(activityDT, animated: true)
        
    }
    
    
    @objc func editTaskData() {
        
        
        if folderIndex != nil && taskIndex != nil {
            
            
            print(toDoListData[folderIndex!].tasks[taskIndex!])
            
            
            let gotoAddT = UIStoryboard(name: "Main", bundle: nil)
            if let openAddTasks =  gotoAddT.instantiateViewController(withIdentifier: "addtask") as? AddNewTaskTableViewController {
                
                
                
                openAddTasks.openType = "Edit"
                openAddTasks.folderIndex = self.folderIndex
                openAddTasks.taskIndex = self.taskIndex
                
                navigationController?.pushViewController(openAddTasks, animated: true)
            }
        } else {
            print("We couldn't find what you're looking for")
        }
        
        
        
    }
    
    
    
}



