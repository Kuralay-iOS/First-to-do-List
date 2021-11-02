//
//  MyGoalsViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 4/14/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

final class MyGoalsViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveGoals: UIButton!
    
    let goals = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "lilies-of-the-valley-2454762_1920.jpg")
        backImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backImage, at: 0)
        
        if let load = goals.string(forKey: "keyS") {
            textView.text = load
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        view.endEditing(true)
    }
    
    @IBAction func savePress(_ sender: UIButton) {
        goals.set(textView.text, forKey: "keyS")
        alertMessage(vc: self, alertTitle: "Successfully Saved", alertMessage: nil)
        
        navigationController?.popViewController(animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        goals.set(textView.text, forKey: "keyS")
    }
}
