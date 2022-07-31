//
//  AlertVC.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 31.07.2022.
//

import UIKit

class AlertVC: UIViewController {
    
    let alertContainer = UIView()
    let alertLabel = UILabel()
    let alertButton = UIButton()
    var alertMessage: CustomError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    init(alertMessage: CustomError) {
        super.init(nibName: nil, bundle: nil)
        self.alertMessage = alertMessage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        view.setAlertContainer(superView: view, container: alertContainer)
        view.setAlertLabel(superview: alertContainer, label: alertLabel, alertMessage: alertMessage)
        view.setAlertButton(superview: alertContainer, button: alertButton)
        configureActionButton()
    }
    
    private func configureActionButton() {
        alertButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
