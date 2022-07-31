//
//  DataProvider.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 18.07.2022.
//

import UIKit

enum Section: Int, CaseIterable { case todo, done } // CaseIterable protocol - count total quantities of cases

class DataProvider: NSObject {
    var taskManager: TaskManager?
}

// MARK: - UITableViewDataSource

extension DataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section), let taskManager = taskManager else { return 0 }
        switch section {
        case .todo: return taskManager.taskCount
        case .done: return taskManager.doneTaskCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: indexPath) as! TaskCell
        guard let section = Section(rawValue: indexPath.section), let taskManager = taskManager else {fatalError()}
        
        var task: TaskModel!
        switch section {
        case .todo: task = taskManager.task(at: indexPath.row)
        case .done: task = taskManager.doneTask(at: indexPath.row)
        }
        cell.configure(task)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    private func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) -> CustomError? {
        guard let section = Section(rawValue: indexPath.section), let taskManager = taskManager else { return .invalidSection }
        
        switch section {
        case .todo: taskManager.checkTask(at: indexPath.row)
        case .done: taskManager.uncheckTask(at: indexPath.row)
        }
        tableView.reloadData()
        return nil
    }
}

// MARK: - UITableViewDelegate

extension DataProvider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        guard let section = Section(rawValue: indexPath.section) else { return "Error" }
        
        switch section {
        case .todo: return "Done"
        case .done: return "Undone"
        }
    }
}
