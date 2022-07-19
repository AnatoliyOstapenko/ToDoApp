//
//  TaskTests.swift
//  ToDoAppTests
//
//  Created by AnatoliiOstapenko on 16.07.2022.
//

import XCTest
@testable import ToDoApp

class TaskTests: XCTestCase {

    func testInitTaskModelTitle() {
        // Arrange
        let task = TaskModel(title: "Foo")
        // Action
        // Assert
        XCTAssertNotNil(task)
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testInitTaskModelTitleAndDiscription() {
        // Arrange
        let task = TaskModel(title: "Foo", description: "Bar")

        // Action
        // Assert
        XCTAssertNotNil(task)
        XCTAssertEqual(task.description, "Bar")
    }

    func testInitDate() {
        // Arrange
        let task = TaskModel(title: "Foo")
        // Assert
        XCTAssertNotNil(task.date)
    }
    
    func testInitLocationName() {
        // Arrange
        let location = LocationModel(name: "Foo")
        let task = TaskModel(title: "Bar", description: "Baz", location: location)
        // Assert
        XCTAssertNotNil(location.name)
        XCTAssertEqual(task.location?.name, "Foo")
        XCTAssertEqual(location, task.location)
        
    }
    
}
