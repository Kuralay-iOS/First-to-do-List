//
//  ViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 1/7/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonNextOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        buttonNextOutlet.layer.cornerRadius = 10
        
        buttonNextOutlet.layer.masksToBounds = true
        
        
        
    }
    
    @IBAction func buttonNext(_ sender: UIButton) {
        
        dismiss(animated: false, completion: nil)
        
    }
    


}

