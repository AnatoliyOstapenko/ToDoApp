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
    var controller: TaskListVC!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DataProvider()
        sut.taskManager = TaskManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListVC.self)) as? TaskListVC
        controller.loadViewIfNeeded()
        
        tableView = controller.taskListTableView
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
    
    func testNumberOfRowsInSectionForTasks() {
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
    
    func testNumberOfRowsInSectionForDoneTasks() {
        // Arrange
        let task = TaskModel(title: "Foo")
        let secondTask = TaskModel(title: "Bar")
        // Action
        sut.taskManager?.add(task: task)
        sut.taskManager?.add(task: secondTask)
        sut.taskManager?.addDoneTask(at: 0)
        // Assert
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), sut.taskManager?.taskCount)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), sut.taskManager?.doneTaskCount)
    }
    
    func testCellForRowAtSuccess() {
        // Arrange
        let task = TaskModel(title: "Foo")
        // Act
        sut.taskManager?.add(task: task)
        tableView.reloadData() // Important step
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        // Assert
        XCTAssertTrue(cell is TaskCell)
    }
    
    func testCellForRowAtMockSuccess() {
        // Arrange
        let task = TaskModel(title: "Foo")
        let tableViewMock = UITableViewMock()
        tableViewMock.dataSource = sut
        tableViewMock.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        // Act
        sut.taskManager?.add(task: task)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        // Assert
        XCTAssertTrue(tableViewMock.cellIsDequeued)
    }
    
    

}

extension DataProviderTests {
    class UITableViewMock: UITableView {
        var cellIsDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
}
