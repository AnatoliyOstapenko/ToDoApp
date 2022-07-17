//
//  TaskModel.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 16.07.2022.
//

import Foundation

struct TaskModel {
    let title: String
    let description: String?
    private(set) var date: Date?
    let location: LocationModel?
    
    init(title: String, description: String? = nil, location: LocationModel? = nil) {
        self.title = title
        self.description = description
        date = Date()
        self.location = location
    }
}
