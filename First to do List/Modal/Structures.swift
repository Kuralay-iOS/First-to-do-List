//
//  Structures.swift
//  First to do List
//
//  Created by Kuralay Sarsenbayeva on 1/8/21.
//  Copyright © 2021 Kuralay Biehler. All rights reserved.
//

import Foundation
import UIKit

struct FoldersStruct : Codable {
    var title : String
    var image : String? = "My Day"
    var tasks : [TasksStruct]
    
}

struct TasksStruct : Codable {
    var title : String
    var description : String
    var scedule: String
    var priority: Int = 0
    var done: Bool = false
    var favorite : Bool = false
}



