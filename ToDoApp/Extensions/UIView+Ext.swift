//
//  UIView+Ext.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 31.07.2022.
//

import UIKit

extension UIView {

    func setAlertContainer(superView: UIView, container: UIView) {
        superView.addSubview(container)
        container.layer.cornerRadius = 10
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.red.cgColor
        container.backgroundColor = .secondarySystemBackground
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: superView.centerYAnchor),
            container.widthAnchor.constraint(equalToConstant: 280),
            container.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
        func setAlertLabel(superview: UIView, label: UILabel, alertMessage: CustomError?) {
            superview.addSubview(label)
            label.text = alertMessage?.rawValue
            label.textAlignment = .center
            label.textColor = .label
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.7
            label.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: superview.topAnchor, constant: 10),
                label.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 10),
                label.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -10),
                label.heightAnchor.constraint(equalToConstant: 100)
            ])
        }
        
        func setAlertButton(superview: UIView, button: UIButton) {
            superview.addSubview(button)
            button.layer.cornerRadius = 10
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.red.cgColor
            button.setTitle("OK", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                button.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -10),
                button.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 20),
                button.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -20),
                button.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
    
}
