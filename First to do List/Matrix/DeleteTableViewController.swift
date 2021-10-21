//
//  DeleteTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 3/14/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class DeleteTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var deleteTextView: UITextView!
    
    @IBOutlet weak var saveDeleteButton: UIButton!
    
    
    let saveDelete = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "pexels-ann-nekr-5797913"))
        tableView.backgroundView?.contentMode = .scaleAspectFill
        
        if let loadDelete = saveDelete.string(forKey: "delete1") {
            deleteTextView.text = loadDelete
            
        }
        
        
    }
    
    
    
    @IBAction func saveDeleteAction(_ sender: UIButton) {
        
        saveDelete.set(deleteTextView.text, forKey: "delete1")
        alertMessage(vc: self, alertTitle: "Successfully Saved", alertMessage: nil)
    }
}
