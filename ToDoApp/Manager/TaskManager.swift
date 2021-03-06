//
//  TaskManager.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 17.07.2022.
//

import Foundation

class TaskManager {
    
    var taskCount: Int { return tasks.count }
    var doneTaskCount: Int { return doneTasks.count }

    private var tasks: [TaskModel] = []
    private var doneTasks: [TaskModel] = []
    
    func add(task: TaskModel) {
        if !tasks.contains(task) { tasks.append(task) }
    }
    
    func task(at index: Int) -> TaskModel? {
        if !tasks.isEmpty {
            return tasks[index]
        }
        return nil
    }
    
    func checkTask(at index: Int) {
        if !tasks.isEmpty {
            let doneTask = tasks.remove(at: index)
            doneTasks.append(doneTask)
        }
    }
    
    func uncheckTask(at index: Int) {
        if !doneTasks.isEmpty {
            let undoneTask = doneTasks.remove(at: index)
            tasks.append(undoneTask)
        }
    }
    
    func doneTask(at index: Int) -> TaskModel? {
        if !doneTasks.isEmpty {
            return doneTasks[index]
        }
        return nil
    }
    
    func removeAllTasks() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
}
