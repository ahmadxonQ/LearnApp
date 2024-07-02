//
//  Bottomsheet.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 14/06/24.
//

import Foundation
import UIKit

import UIKit
import FloatingPanel

class BottomSheetViewController: UIViewController {
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupKeyboardNotifications()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text"
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let offset = keyboardFrame.height / 2
            (parent as? FloatingPanelController)?.move(to: .full, animated: true) {
                self.view.frame.origin.y -= offset
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        (parent as? FloatingPanelController)?.move(to: .half, animated: true) {
            self.view.frame.origin.y = 0
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
