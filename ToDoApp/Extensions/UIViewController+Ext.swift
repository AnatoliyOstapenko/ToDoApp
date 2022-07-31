//
//  UIViewController+Ext.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 31.07.2022.
//

import UIKit

extension UIViewController {
    
    func presentAlert(alertMessage: CustomError) {
        let alert = AlertVC(alertMessage: alertMessage)
        alert.modalPresentationStyle = .overFullScreen
        alert.modalTransitionStyle = .crossDissolve
        self.present(alert, animated: true)
    }
}
