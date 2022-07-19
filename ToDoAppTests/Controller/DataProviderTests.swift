//
//  DataProviderTests.swift
//  ToDoAppTests
//
//  Created by AnatoliiOstapenko on 18.07.2022.
//

import XCTest
@testable import ToDoApp

class DataProviderTests: XCTestCase {
    
    var sut: DataProvider!
    var tableView: UITableView!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DataProvider()
        sut.taskManager = TaskManager()
        tableView = UITableView()
        tableView.dataSource = sut
        
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
        try super.tearDownWithError()
    }
    
    func testNumberOfSectionsSuccess() {
        // Assert
        XCTAssertEqual(tableView?.numberOfSections, 2)
    }
    
    func testNumberOfRowsIsSectionSuccess() {
        // Arrange
        let task = TaskModel(title: "Foo")
        let nextTask = TaskModel(title: "Bar")
        // Action
        sut?.taskManager?.add(task: task)
        // Assert
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), sut.taskManager?.taskCount)
        // Action
        sut.taskManager?.add(task: nextTask)
        tableView.reloadData()
        // Assert
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), sut.taskManager?.taskCount)
    }

   

}