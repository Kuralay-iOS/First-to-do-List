//
//  DecideTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 3/14/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class DecideTableViewController: UITableViewController {
    
    
    @IBOutlet weak var decideTextView: UITextView!
    

    @IBOutlet weak var saveDecideButton: UIButton!
    
    
    let saveDecide = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "3b"))
        tableView.backgroundView?.contentMode = .scaleToFill
        
        
        if let loadDecideData = saveDecide.string(forKey: "decide1") {
        
        decideTextView.text = loadDecideData
            
        }

        
}
    @IBAction func saveDecideAction(_ sender: UIButton) {
        
        saveDecide.set(decideTextView.text, forKey: "decide1")
        alertMessage(vc: self, alertTitle: "Successfully Saved", alertMessage: nil)
    }
}
