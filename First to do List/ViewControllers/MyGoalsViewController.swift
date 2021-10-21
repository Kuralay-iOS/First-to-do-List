//
//  MyGoalsViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 4/14/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class MyGoalsViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    
    @IBOutlet weak var saveGoals: UIButton!
    
    let saveG = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "lilies-of-the-valley-2454762_1920.jpg")
        backgroundImage.contentMode = .scaleAspectFill
        
        
        
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        if let loadGoals = saveG.string(forKey: "keyS") {
            textView.text = loadGoals
            
        }
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        view.endEditing(true)
    }
    
    
    @IBAction func savePress(_ sender: UIButton) {
        
        saveG.set(textView.text, forKey: "keyS")
        
        alertMessage(vc: self, alertTitle: "Successfully Saved", alertMessage: nil)
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        saveG.set(textView.text, forKey: "keyS")
        
    }
    
    
    
    
}
