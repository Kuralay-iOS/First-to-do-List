//
//  MatrixViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 3/3/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class MatrixViewController: UIViewController {
    
    
    @IBOutlet weak var verticalText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        verticalText.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        
        
        
        
    }
    
    @IBAction func doAction(_ sender: UIButton) {
        
        let buttonDo = UIStoryboard(name: "Main", bundle: nil)
        if let goToDoVC = buttonDo.instantiateViewController(withIdentifier: "doID") as? DoTableViewController {
            navigationController?.pushViewController(goToDoVC, animated: true)
            
            
        }
        
    }
    
    
    @IBAction func delegateAction(_ sender: UIButton) {
        
        let buttonDelegate = UIStoryboard(name: "Main", bundle: nil)
        if let goToDelegateVC = buttonDelegate.instantiateViewController(identifier: "delegateID") as? DelegateTableViewController {
            navigationController?.pushViewController(goToDelegateVC, animated: true)
            
        }
    }
    
    
    @IBAction func decideAction(_ sender: UIButton) {
        
        let buttonDecide = UIStoryboard(name: "Main", bundle: nil)
        if let goToDecide = buttonDecide.instantiateViewController(identifier: "decideID") as? DecideTableViewController {
            navigationController?.pushViewController(goToDecide, animated: true)
            
        }
    }
    
    
    @IBAction func deleteAction(_ sender: UIButton) {
        
        let buttonDelete = UIStoryboard(name: "Main", bundle: nil)
        if let goToDelete = buttonDelete.instantiateViewController(identifier: "deleteID") as? DeleteTableViewController {
            navigationController?.pushViewController(goToDelete, animated: true)
            
        }
    }
    
    
    
}
