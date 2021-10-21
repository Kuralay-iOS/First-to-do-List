//
//  FavoriteTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 1/7/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    
    let modalForFav = Modal()
    
    var mySearchBar = UISearchBar()
    
    
    var tasksUpdate = [TasksStruct]()
    var defaultTasks = [TasksStruct]()
    
    var defoultFolder = [FoldersStruct]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarSetup()
        
        checkHeaderFavorite()  
    }
    
    
    
    func checkHeaderFavorite() {
        
        if toDoListData.count == 0 {
            tableView.tableHeaderView = nil
        } else {
            
            searchBarSetup()
        }
    }
    
    
    func searchBarSetup() {
        
        mySearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 44))
        mySearchBar.delegate = self
        
        
       
        mySearchBar.tintColor = .red
        
        
        
        if  let searchTextField = mySearchBar.value(forKey: "searchField") as? UITextField {
            searchTextField.textColor = .darkGray
            searchTextField.placeholder = "Search"
        }
        
        tableView.tableHeaderView = mySearchBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "pexels-anna-nekrashevich-7214789"))
        tableView.backgroundView?.contentMode = .scaleAspectFill
        
        
        tabBarController?.navigationItem.title = "Favorites"
        
        
        
        
        tasksUpdate = modalForFav.favOnly()
        defaultTasks = modalForFav.favOnly()
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cellFavorite = tableView.cellForRow(at: indexPath)
        
        cellFavorite?.backgroundColor = #colorLiteral(red: 0.9564451575, green: 0.7439501804, blue: 0.9081695371, alpha: 1)
        
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cellFavorite = tableView.cellForRow(at: indexPath)
        
        cellFavorite?.backgroundColor = #colorLiteral(red: 0.8114747398, green: 0.9630517075, blue: 0.8929129137, alpha: 1)
    }
    
    
    
    @objc func addAlertFav() {
        
        let alertFav = UIAlertController(title: "New folder", message: "Enter the text...", preferredStyle: .alert)
        
        
        let buttonFav = UIAlertAction(title: "Add new folder", style: .default) { (_) in
            
            let folderTextFav = alertFav.textFields![0] as UITextField
            
            
            toDoListData.append(FoldersStruct(title: folderTextFav.text!, tasks: []))
            
            self.modalForFav.saveToDoList()
            self.modalForFav.loadToDoList()
            self.defoultFolder = toDoListData
            
            
            
            self.tableView.reloadData()
            
            
        }
        
        
        let buttonCancelFav = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
        }
        
        alertFav.addAction(buttonCancelFav)
        alertFav.addAction(buttonFav)
        
        
        
        alertFav.addTextField { (tField) in
            tField.placeholder = "Folder name"
            
        }
        
        present(alertFav, animated: true)
        
    }
    
    
    
    func filterForSearchBar(text: String) {
        tasksUpdate = defaultTasks.filter({ (myFilter) -> Bool in
            let searchResult = myFilter.scedule + myFilter.title
            
            return searchResult.lowercased().contains(text.lowercased())
        })
        
        tableView.reloadData()
        
        
        
    }
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return tasksUpdate.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tasksUpdate[indexPath.row].title
        
        return cell
    }
    
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let linkStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let linkNextTVC = linkStoryBoard.instantiateViewController(identifier: "detailtask") as? TasksTableViewController {
            
            linkNextTVC.title = "Edit"
            linkNextTVC.folderIndex = indexPath.row
            tabBarController?.navigationController?.pushViewController(linkNextTVC, animated: true)
        }else{
            print("Error...")
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
    
}


extension FavoriteTableViewController : UISearchBarDelegate {
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        mySearchBar.setShowsCancelButton(true, animated: true)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        mySearchBar.setShowsCancelButton(false, animated: true)
        
        tasksUpdate = defaultTasks
        
        tableView.reloadData()
        searchBar.text = nil
        mySearchBar.endEditing(true)
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            tasksUpdate = defaultTasks
            tableView.reloadData()
            
            
            tabBarController?.navigationItem.title = "All favorite tasks"
        } else {
            
            filterForSearchBar(text: searchText)
            tabBarController?.navigationItem.title = " \(tasksUpdate.count)"
            
            
            if tasksUpdate.count == 0 {
                tabBarController?.navigationItem.title = "We couldn't find what you're looking for."
            }
            
        }
        
        
    }
    
    
    
    
    
    
}
