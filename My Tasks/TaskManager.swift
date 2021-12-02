//
//  TaskUserDefauls.swift
//  My Tasks
//
//  Created by Rodrigo Rodrigues on 23/11/21.
//

import UIKit

class TaskManager{
    
    let key = "listTask"
    var task: [String] = []
    
    func remove(indice: Int) {
        
        task = list()
        task.remove(at: indice)
        UserDefaults.standard.set(task, forKey: key)
    }
    
    func save(tasks: String){
        
        task = list()
        
        task.append( tasks )
        UserDefaults.standard.set(task, forKey: key)
    }
    
    func list() -> Array<String> {
        
        let data = UserDefaults.standard.object(forKey: key)
        
        if data != nil{
            return data as? Array<String> ?? []
        }else{
            return []
        }
    }
}
