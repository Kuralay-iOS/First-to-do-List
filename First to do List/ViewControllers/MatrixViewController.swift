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
        let doAction = UIStoryboard(name: "Main", bundle: nil)
        if let doVC = doAction.instantiateViewController(withIdentifier: "doID") as? DoTableViewController {
            navigationController?.pushViewController(doVC, animated: true)
        }
    }

    @IBAction func delegateAction(_ sender: UIButton) {
        let delegate = UIStoryboard(name: "Main", bundle: nil)
        if let delegateVC = delegate.instantiateViewController(identifier: "delegateID") as? DelegateTableViewController {
            navigationController?.pushViewController(delegateVC, animated: true)
        }
    }
    
    @IBAction func decideAction(_ sender: UIButton) {
        let decide = UIStoryboard(name: "Main", bundle: nil)
        if let decideVC = decide.instantiateViewController(identifier: "decideID") as? DecideTableViewController {
            navigationController?.pushViewController(decideVC, animated: true)
        }
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        let deleteAction = UIStoryboard(name: "Main", bundle: nil)
        if let deleteVC = deleteAction.instantiateViewController(identifier: "deleteID") as? DeleteTableViewController {
            navigationController?.pushViewController(deleteVC, animated: true)
        }
    }
}
