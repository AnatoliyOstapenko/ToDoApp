//
//  TaskManager.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 17.07.2022.
//

import Foundation

class TaskManager {
    var taskCount = 0
    var doneTaskCount = 0
    private var tasks: [TaskModel] = []
    
    func add(task: TaskModel) {
        taskCount += 1
        tasks.append(task)
    }
    
    func currentTask(at index: Int) -> TaskModel? {
        if !tasks.isEmpty {
            return tasks[index]
        }
        return nil
    }
}
