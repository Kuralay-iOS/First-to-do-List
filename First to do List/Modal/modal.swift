//
//  modal.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 1/18/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import Foundation
import UIKit


var toDoListData : [FoldersStruct] = []


final class Modal {
    
    let getUserDefaults = UserDefaults.standard
    
    func saveToDoList() {
        getUserDefaults.set(try? PropertyListEncoder().encode(toDoListData), forKey: "data")
    }
    
    func loadToDoList() {
        if let todoData = getUserDefaults.value(forKey: "data") as? Data {
            if  let data = try? PropertyListDecoder().decode(Array<FoldersStruct>.self, from: todoData) {
                toDoListData = data
            }
        }
    }
    
    
    
    func favOnly() -> [TasksStruct] {
        var task = [TasksStruct]()
        loadToDoList()

        for (ind, _) in toDoListData.enumerated() {
            
            let folder = toDoListData[ind].tasks
            
            let favArray = folder.filter({$0.favorite == true})
            
            task.append(contentsOf: favArray)
        }
        
        return task
    }
    
    
}
