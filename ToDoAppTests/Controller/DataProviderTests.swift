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
    var tableViewMock: UITableViewMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DataProvider()
        sut.taskManager = TaskManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListVC.self)) as? TaskListVC
        controller.loadViewIfNeeded()
        tableView = controller.taskListTableView
        tableView.dataSource = sut
        tableView.delegate = sut
        
        tableViewMock = UITableViewMock()

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
        sut.taskManager?.checkTask(at: 0)
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
    
    func testCellForRowAtMockSection0() {
        // Arrange
        let task = TaskModel(title: "Foo")
        let tableView = tableViewMock.tableViewMock(dataSource: sut)
        // Act
        sut.taskManager?.add(task: task)
        tableView.reloadData()
        _ = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        // Assert
        XCTAssertTrue(tableView.cellIsDequeued)
    }
    
    func testTaskCellMockForSection0() {
        // Arrange
        let task = TaskModel(title: "Foo")
        let tableView = tableViewMock.tableViewMock(dataSource: sut)
        // Act
        sut.taskManager?.add(task: task)
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! TaskCellMock
        // Assert
        XCTAssertEqual(cell.task, task)
        
    }
    
    func testTaskCellMockForSection1() {
        // Arrange
        let task = TaskModel(title: "Foo")
        let tableView = tableViewMock.tableViewMock(dataSource: sut)
        // Act
        sut.taskManager?.add(task: task)
        sut.taskManager?.checkTask(at: 0)
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! TaskCellMock
        // Assert
        XCTAssertEqual(cell.task, task)
    }
    
    func testDoneButtonInSection0() {
        // Arrange
        let buttonTitle = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 0))
        // Assert
        XCTAssertEqual(buttonTitle, "Done")
    }
    
    func testDoneButtonInSection1() {
        // Arrange
        let buttonTitle = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 1))
        // Assert
        XCTAssertEqual(buttonTitle, "Undone")
    }
    
    func testTableViewCommitSection0() {
        // Arrange
        let task = TaskModel(title: "Foo")
        // Act
        sut.taskManager?.add(task: task)
        tableView.dataSource?.tableView?(tableView, commit: .delete, forRowAt: IndexPath(row: 0, section: 1))
        // Assert
        XCTAssertEqual(sut.taskManager?.taskCount, 0)
        XCTAssertEqual(sut.taskManager?.doneTaskCount, 1)
    }
    
    func testTableViewCommitSection1() {
        // Arrange
        let task = TaskModel(title: "Foo")
        // Act
        sut.taskManager?.add(task: task)
        sut.taskManager?.checkTask(at: 0)
        tableView.reloadData()
        tableView.dataSource?.tableView?(tableView, commit: .delete, forRowAt: IndexPath(row: 0, section: 1))
        // Assert
        XCTAssertEqual(sut.taskManager?.taskCount, 1)
        XCTAssertEqual(sut.taskManager?.doneTaskCount, 0)
    }

}

extension DataProviderTests {
    
    class UITableViewMock: UITableView {
        var cellIsDequeued = false
        
        func tableViewMock(dataSource: UITableViewDataSource) -> UITableViewMock {
            let tableViewMock = UITableViewMock(frame: CGRect(x: 0, y: 0, width: 375, height: 658))
            tableViewMock.dataSource = dataSource
            tableViewMock.register(TaskCellMock.self, forCellReuseIdentifier: String(describing: TaskCell.self))
            return tableViewMock
        }
        
        override func dequeueReusableCell(withIdentifier      identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            return     super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class TaskCellMock: TaskCell {
        var task: TaskModel?
        
        override func configure(_ task: TaskModel) {
            self.task = task
        }
    }
}
