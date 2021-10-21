//
//  DelegateTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 3/14/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class DelegateTableViewController: UITableViewController {
    
    @IBOutlet weak var delegateTextView: UITextView!
    
    
    @IBOutlet weak var saveDelegateButton: UIButton!
    
    
    let saveDelegateLoad = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "paper-flower-background-4794429_1280"))
        tableView.backgroundView?.contentMode = .scaleToFill
        
        
        if let loadDelegateData = saveDelegateLoad.string(forKey: "delegate1") {
            delegateTextView.text = loadDelegateData
        }
        
        
    }
    
    
    @IBAction func saveDelegateButtonAction(_ sender: UIButton) {
        
        saveDelegateLoad.set(delegateTextView.text, forKey: "delegate1")
        alertMessage(vc: self, alertTitle: "Successfully Saved", alertMessage: nil)
        
        
    }
    
}
