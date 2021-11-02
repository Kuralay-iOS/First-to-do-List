//
//  TasksTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 1/7/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

final class TasksTableViewController: UITableViewController {
   
    let getModal = Modal()
    
    var folderIndex: Int?
    var tasksArray = [TasksStruct]()
    var defaultTasksArray = [TasksStruct]()
    var serchBar = UISearchBar()
    
    func filterForSearchTasks(text: String) {
        tasksArray = defaultTasksArray.filter({(filterFolders) -> Bool in
            let searchResalt = filterFolders.title
            return searchResalt.lowercased().contains(text.lowercased())})
        
        tableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let addTasks = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTasks))
        navigationItem.rightBarButtonItem = addTasks
    }
    
    func checkHeaderTasks() {
        if tasksArray.count == 0 {
            tableView.tableHeaderView = nil
        } else {
            searchBarSetupTasks()
        }
    }
    
    func searchBarSetupTasks() {
        serchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        serchBar.delegate = self
        serchBar.tintColor = .blue
        
        if  let modify =  serchBar.value(forKey: "searchField") as? UITextField {
            modify.tintColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            modify.placeholder = "Search"
        }
        tableView.tableHeaderView = serchBar
    }
    
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cellTasks = tableView.cellForRow(at: indexPath)
        cellTasks?.backgroundColor = #colorLiteral(red: 0.9564451575, green: 0.780750745, blue: 0.6915499707, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cellTasks = tableView.cellForRow(at: indexPath)
        cellTasks?.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.6734840638, blue: 0.6619468819, alpha: 1)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasksArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasks", for: indexPath)
        cell.textLabel?.text = tasksArray[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailTVC(indexFromArray: indexPath.row)
    }
    
    func goToDetailTVC(indexFromArray: Int) {
        let detailStoryboard = UIStoryboard(name: "Tasks", bundle: nil)
        if let detail = detailStoryboard.instantiateViewController(withIdentifier: "detailtask") as? DataFromTasksTableViewController {
            detail.dataFor = tasksArray[indexFromArray]
            detail.folderIndex = self.folderIndex
            detail.taskIndex = indexFromArray
            
            navigationController?.pushViewController(detail, animated: true)
            
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let getIndex = folderIndex {
                toDoListData[getIndex].tasks.remove(at: indexPath.row)
                tasksArray.remove(at: indexPath.row)
                getModal.saveToDoList()
                checkHeaderTasks()
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc func addNewTasks() {
        let storyBoard = UIStoryboard(name: "Tasks", bundle: nil)
        if let openVC = storyBoard.instantiateViewController(withIdentifier: "addtask") as? AddNewTaskTableViewController {
            openVC.folderIndex = self.folderIndex
            openVC.openType = "add"

            navigationController?.pushViewController(openVC, animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if let getIndex = folderIndex {
            tasksArray = toDoListData[getIndex].tasks
            defaultTasksArray = tasksArray
            tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "pexels-karolina-grabowska-4210787"))
            tableView.backgroundView?.contentMode = .scaleAspectFit
        }
        
        tableView.reloadData()
        checkHeaderTasks()
    }
}




extension TasksTableViewController : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        serchBar.setShowsCancelButton(true, animated: true)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        serchBar.setShowsCancelButton(false, animated: true)
        tasksArray = defaultTasksArray
        tableView.reloadData()
        searchBar.text = nil
        serchBar.endEditing(true)
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            tasksArray = defaultTasksArray
            tableView.reloadData()
            tabBarController?.navigationItem.title = "All favorite tasks"
        } else {
            filterForSearchTasks(text: searchText)
            tabBarController?.navigationItem.title = "Found \(tasksArray.count)"
            if tasksArray.count == 0 {
                tabBarController?.navigationItem.title = "We couldn't find what you're looking for."
            }
        }
    }
}



