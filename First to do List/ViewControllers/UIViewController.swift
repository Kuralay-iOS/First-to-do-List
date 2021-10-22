//
//  MyFunctions.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 3/17/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
