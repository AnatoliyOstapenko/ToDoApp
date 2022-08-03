//
//  TaskCellTests.swift
//  ToDoAppTests
//
//  Created by AnatoliiOstapenko on 31.07.2022.
//

import XCTest
@testable import ToDoApp

class TaskCellTests: XCTestCase {
    
    var sut: TaskListVC!
    var vc: TaskListVC!
    var tableView: UITableView!

    override func setUpWithError() throws {
        try super.setUpWithError()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        vc = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListVC.self)) as? TaskListVC
//        vc.loadViewIfNeeded()
        
        vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? TaskListVC
        vc.loadViewIfNeeded()
        tableView = vc.taskListTableView
        let dataSource = UITableViewDataSourceMock()
        tableView.dataSource = dataSource
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testCellHasTitleLable() {
        // Arrange
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as? TaskCell
        // Action
        // Assert
        XCTAssertNotNil(cell?.titleLabel)
    }

}

extension TaskCellTests {

    class UITableViewDataSourceMock: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            return UITableViewCell()
        }
        
        
    }
}
