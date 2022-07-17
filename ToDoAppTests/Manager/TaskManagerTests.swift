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
    
    override func setUp() {
        sut = TaskManager()
    }
    
    override func tearDown() {
        sut = nil
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
    
    func testCurrentTaskSucces() {
        // Arrange
        let task = TaskModel(title: "Foo")
        sut.add(task: task)
        let returnedValue = sut.currentTask(at: 0)
        // Assert
        XCTAssertNotNil(task.title)
        XCTAssertEqual(task.title, returnedValue?.title)
    }
    
    func testCurrentTaskFailed() {
        // Arrange
        let returnedNil = sut.currentTask(at: 0)
        // Assert
        XCTAssertEqual(returnedNil?.title, nil)
    }
}
