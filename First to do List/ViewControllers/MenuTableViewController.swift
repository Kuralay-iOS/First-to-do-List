//
//  MenuTableViewController.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 1/7/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        tabBarController?.navigationItem.title = "Menu"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 2:
            print("My Goals")
            goToMyGoals()
        case 3:
            print("Matrix")
            goToMatrix()
        case 4:
            print("Share")
            shareInfo(textShare: "My share text")
        case 5:
            openEmail(email: "kuralaybiehler@gmail.com")
        default:
            break
        }
    }
    
    func goToMyGoals() {
        let myGoals = UIStoryboard(name: "Main", bundle: nil)
        if let vc = myGoals.instantiateViewController(withIdentifier: "myGoals") as? MyGoalsViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func goToMatrix() {
        let matrix1 = UIStoryboard(name: "Main", bundle: nil)
        if let direction = matrix1.instantiateViewController(withIdentifier: "matrix") as? MatrixViewController {
            navigationController?.pushViewController(direction, animated: true)
        }
    }
    
    // MARK: - Share text
    func shareInfo(textShare: String) {
        let share = UIActivityViewController(activityItems: [textShare], applicationActivities: [])
        present(share, animated: true)
    }
}

func openEmail(email: String) {
    if let url = URL(string: "mailto: \(email)") {
        UIApplication.shared.open(url)
    }
}




