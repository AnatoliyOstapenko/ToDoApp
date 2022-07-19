//
//  DataProvider.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 18.07.2022.
//

import UIKit

enum Section: Int { case todo, done }

class DataProvider: NSObject {
    var taskManager: TaskManager?
}

extension DataProvider: UITableViewDelegate {}
extension DataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section), let taskManager = taskManager else { return 0 }
        switch section {
        case .todo: return taskManager.taskCount
        case .done: return taskManager.doneTaskCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
