//
//  DoTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 3/11/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class DoTableViewController: UITableViewController {
    
    
    @IBOutlet weak var textViewOutlet: UITextView!
    
    @IBOutlet weak var buttonSave: UIButton!
    

    let saveLoad = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "flat-lay-cake-slice-with-cup-tea"))
        tableView.backgroundView?.contentMode = .scaleAspectFill
        
 
        if let loadData = saveLoad.string(forKey: "param1") {
            textViewOutlet.text = loadData
        }
        
        
    }
    
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        
      
        saveLoad.set(textViewOutlet.text, forKey: "param1")
        
        alertMessage(vc: self, alertTitle: "Successfully Saved", alertMessage: nil)
        
    }
    
    
    
    
    
    
    
}









