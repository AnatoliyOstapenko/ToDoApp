//
//  ViewController.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 16.07.2022.
//

import UIKit

class TaskListVC: UIViewController {

    @IBOutlet weak var taskListTableView: UITableView!
    @IBOutlet var dataProvider: DataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

