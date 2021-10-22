//
//  MyFunctions.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 3/17/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import Foundation
import UIKit

func alertMessage(vc: UIViewController, alertTitle: String?, alertMessage: String?) {
     let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    vc.present(alert, animated: true, completion: nil)
}

