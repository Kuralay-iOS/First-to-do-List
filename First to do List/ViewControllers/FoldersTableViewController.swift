//
//  FoldersTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 1/7/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class FoldersTableViewController: UITableViewController {
    
  
    let toDoModal = Modal()
    
    var footerLabel = UILabel()
    
    var searchBarFolders = UISearchBar()
    
    
    
    
    var defoultTasksFolders = [FoldersStruct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addFooterView()
        
        toDoModal.loadToDoList()
        
        defoultTasksFolders = toDoListData
        
        performSegue(withIdentifier: "present", sender: nil)
        
        
        footerLabelUpdate()
        
        checkHeaderFolders()
        
     
        tabBarController?.selectedIndex = 1
        
        
    }
    
 
    func checkHeaderFolders() {
        
        if toDoListData.count == 0 {
            tableView.tableHeaderView = nil
        } else {
            
            searchBarSetupFolders()
        }
    }
    
    
    
    func searchBarSetupFolders() {
        
        searchBarFolders = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        
        searchBarFolders.delegate = self
        
        searchBarFolders.tintColor = .red
        
        if  let textSearchBarFolders = searchBarFolders.value(forKey: "searchField") as? UITextField {
            
            textSearchBarFolders.tintColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            textSearchBarFolders.placeholder = "Search"
        }
        
        tableView.tableHeaderView = searchBarFolders
        
        
        
    }
    
    
    
    func addFooterView() {
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 60))
        
        myView.backgroundColor = .clear
        
        footerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 60))
        
        footerLabel.backgroundColor = .clear
        footerLabel.textColor = .black
        footerLabel.text = "List is empty!"
        footerLabel.textAlignment = .center
        
        
        tableView.tableFooterView = myView
        myView.addSubview(footerLabel)
        
    }
    
    func footerLabelUpdate() {
        if toDoListData.isEmpty {
            footerLabel.text = "List is empty"
            
        } else {
            footerLabel.text = ""
        }
    }
    
    
    func filterForSearchFolders(text: String) {
        
        toDoListData = defoultTasksFolders.filter({(filterFolders) -> Bool in
            
            let searchResaltFolders = filterFolders.title
            
            return searchResaltFolders.lowercased().contains(text.lowercased())
        })
        
        tableView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        tabBarController?.navigationItem.title = "Folders"
        buttonAdd()
        
      
        
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "15"))
        tableView.backgroundView?.contentMode = .scaleToFill
        
    }
    
    

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        tabBarController?.navigationItem.rightBarButtonItem = nil
        
    }
  
    
    func buttonAdd() {
      
        let addd = UIBarButtonItem(title: "🗂 New folder", style: .plain, target: self, action: #selector(addAlertFolder))
        
        
        tabBarController?.navigationItem.rightBarButtonItem = addd
        
    }
    
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.backgroundColor = #colorLiteral(red: 0.8155996203, green: 0.8157376647, blue: 0.8155801892, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.backgroundColor = #colorLiteral(red: 0.7813293147, green: 0.7813293147, blue: 0.7813293147, alpha: 1)
        
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoListData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "folder", for: indexPath)
        
        cell.textLabel?.text = " \(toDoListData[indexPath.row].title)"
        
        
        if toDoListData[indexPath.row].title == "Fav" {
            cell.imageView?.tintColor = .green
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let destNextTVC = myStoryBoard.instantiateViewController(identifier: "tasks") as? TasksTableViewController {
            destNextTVC.title = "Tasks"
            destNextTVC.folderIndex = indexPath.row
            tabBarController?.navigationController?.pushViewController(destNextTVC, animated: true)
        } else {
            print("Some error")
            
        }
    }
    
    
    @objc func addAlertFolder() {
        
        let alertFolder = UIAlertController(title: "New Folder", message: "Enter the text", preferredStyle: .alert)
        
        
        
        
        
        let buttonFolder = UIAlertAction(title: "Add a new folder", style: .default) { (_) in
            
            let folderTextField = alertFolder.textFields![0] as UITextField
            
            
            toDoListData.append(FoldersStruct(title: folderTextField.text!, tasks: []))
            self.toDoModal.saveToDoList()
            self.toDoModal.loadToDoList()
            self.defoultTasksFolders = toDoListData
            
            self.tableView.reloadData()
            self.footerLabelUpdate()
            self.checkHeaderFolders()
            
            
            
            
        }
        
        
        let buttonCancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
        }
        
        alertFolder.addAction(buttonCancel)
        alertFolder.addAction(buttonFolder)
        
        
        
        alertFolder.addTextField { (tField) in
            tField.placeholder = "Folder's name"
            
        }
        
        present(alertFolder, animated: true)
        
    }
    
    
    
    
    
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    
    /*
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     
     toDoListData.remove(at: indexPath.row)
     toDoModal.saveToDoList()
     footerLabelUpdate()
     checkHeaderFolders()
     
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     
     // to add swipe actions
     
     */
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction (style: .destructive, title: "Delete") { (contextualAction, view, boolValue) in
            
            
            toDoListData.remove(at: indexPath.row)
            
        
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            self.toDoModal.saveToDoList()
            
            self.footerLabelUpdate()
            self.checkHeaderFolders()
            
        }
        
        
        delete.image = UIImage(systemName: "trash")
        
        let edit = UIContextualAction (style: .destructive, title: "Edit" ) { (contextualAction, view, boolValue) in
            
         
            self.showText(getIndexPath: indexPath)
        }
     
        edit.image = UIImage(systemName: "folder")
        
        edit.backgroundColor = .green
       
        let swipeActions = UISwipeActionsConfiguration(actions: [delete, edit])
     
        return swipeActions
    }
    
    
    
    
    
    
    func showText(getIndexPath: IndexPath) {
        let alert = UIAlertController(title: "Titles", message: "Message", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            
        }
        
        
        alert.addAction(cancel)
        
        present(alert, animated: true)
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
    // how to check dark mode
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                print("Sorry, dark mode is not available")
            } else {
                print("L mode")
            }
        }
    }
    
}


extension FoldersTableViewController : UISearchBarDelegate {
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBarFolders.setShowsCancelButton(true, animated: true)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarFolders.setShowsCancelButton(false, animated: true)
        
        toDoListData = defoultTasksFolders
        
        tableView.reloadData()
        searchBar.text = nil
        searchBarFolders.endEditing(true)
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            toDoListData = defoultTasksFolders
            tableView.reloadData()
            
            
            tabBarController?.navigationItem.title = "All folders"
        } else {
            
            filterForSearchFolders(text: searchText)
            tabBarController?.navigationItem.title = " \(toDoListData.count)"
            
            
            if toDoListData.count == 0 {
                tabBarController?.navigationItem.title = "We couldn't find what you're looking for."
            }
            
        }
        
        
    }
    
    
    
    
    
    
}
