//
//  TaskListVCTests.swift
//  ToDoAppTests
//
//  Created by AnatoliiOstapenko on 18.07.2022.
//

import XCTest
@testable import ToDoApp

class TaskListVCTests: XCTestCase {
    
    var sut: TaskListVC?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListVC.self))
        sut = vc as? TaskListVC
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testTableViewSuccess() {
        // Arrange
        sut?.loadViewIfNeeded()
        // Assert
        XCTAssertNotNil(sut?.taskListTableView)
        
        
    }

}
