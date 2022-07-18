//
//  TaskManagerTests.swift
//  ToDoAppTests
//
//  Created by AnatoliiOstapenko on 17.07.2022.
//

import XCTest
@testable import ToDoApp

class TaskManagerTests: XCTestCase {
    
    var sut: TaskManager!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TaskManager()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testInitTaskCountZero() {
        // Arrange
        let zero: Int = 0
        // Assert
        XCTAssertEqual(sut.taskCount, zero)
    }
    
    func testInitDoneTaskCountZero() {
        // Arrange
        let zero: Int = 0
        // Assert
        XCTAssertEqual(sut.doneTaskCount, zero)
    }
    
    func testAddTaskCountIncrement() {
        // Arrange
        let task = TaskModel(title: "Foo")
        sut.add(task: task)
        // Assert
        XCTAssertEqual(sut.taskCount, 1)
    }
    
    func testCheckTaskSuccess() {
        // Arrange
        let task = TaskModel(title: "Foo")
        sut.add(task: task)
        let returnedValue = sut.checkTask(at: 0)
        // Assert
        XCTAssertEqual(task, returnedValue)
    }
    
    func testCheckTaskFailed() {
        // Arrange
        let returnedNil = sut.checkTask(at: 0)
        // Assert
        XCTAssertEqual(returnedNil, nil)
    }
    
    func testAddDoneTaskSuccess() {
        // Arrange
        let task = TaskModel(title: "Foo")
        sut.add(task: task)
        sut.addDoneTask(at: 0)
        // Assert
        XCTAssertEqual(sut.doneTaskCount, 1)
        XCTAssertEqual(sut.taskCount, 0)
    }
    
    func testCheckTaskRemoved() {
        // Arrange
        let firstTask = TaskModel(title: "Foo")
        let secondTask = TaskModel(title: "Bar")
        sut.add(task: firstTask)
        sut.add(task: secondTask)
        sut.addDoneTask(at: 0)
        let result = sut.checkTask(at: 0)
        // Assert
        XCTAssertEqual(result, secondTask)
    }
    
    func testDoneTaskSuccess() {
        // Arrange
        let task = TaskModel(title: "Foo")
        sut.add(task: task)
        sut.addDoneTask(at: 0)
        let result = sut.checkDoneTask(at: 0)
        // Assert
        XCTAssertEqual(result, task)
        
    }
    
    func testDoneTaskFailed() {
        XCTAssertNil(sut.checkDoneTask(at: 0))
    }
    
    func testRemoveAllTasksSuccess() {
        // Arrange
        sut.add(task: TaskModel(title: "Foo"))
        sut.add(task: TaskModel(title: "Bar"))
        // Act
        sut.addDoneTask(at: 0)
        sut.removeAllTasks()
        // Assert
        XCTAssertNil(sut.checkTask(at: 0))
        XCTAssertNil(sut.checkDoneTask(at: 0))
        XCTAssertTrue(sut.taskCount == 0)
        XCTAssertTrue(sut.doneTaskCount == 0)
    }
    
    func testAddTheSameElementIsNotPossible() {
        // Arrange
        let title = TaskModel(title: "Foo")
        let theSameTitle = TaskModel(title: "Foo")
        // Act
        sut.add(task: title)
        sut.add(task: theSameTitle)
        // Assert
        XCTAssertTrue(sut.taskCount == 1)
        
    }
}
