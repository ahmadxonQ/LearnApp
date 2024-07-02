//
//  ChildViewController.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 14/06/24.
//

import UIKit
import FloatingPanel

class ReturnOrderViewController: UIViewController {
   
    let textview = UITextView()
    let textview2 = UITextView()
    var fpc = FloatingPanelController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
    }

    func setView() {
       
        view.addSubview(textview)
        textview.translatesAutoresizingMaskIntoConstraints = false
        textview.topAnchor.constraint(equalTo: view.top, constant: 20).isActive = true
        textview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        textview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        textview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        textview.textContainerInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        textview.delegate = self
        textview.backgroundColor = .secondarySystemBackground
        textview.layer.cornerRadius = 12
        textview.returnKeyType = .done
        textview.isScrollEnabled = true
        textview.isDirectionalLockEnabled = true
        textview.layer.borderColor = UIColor.black.cgColor
        
        view.addSubview(textview2)
        textview2.translatesAutoresizingMaskIntoConstraints = false
        textview2.topAnchor.constraint(equalTo: textview.bottom, constant: 20).isActive = true
        textview2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        textview2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        textview2.heightAnchor.constraint(equalToConstant: 150).isActive = true
        textview2.textContainerInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        textview2.delegate = self
        textview2.backgroundColor = .secondarySystemBackground
        textview2.layer.cornerRadius = 12
        textview2.returnKeyType = .done
        textview2.isScrollEnabled = true
        textview2.isDirectionalLockEnabled = true
        textview2.layer.borderColor = UIColor.black.cgColor
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func confirmTap() {
        // Confirm action logic
    }

    @objc func dismissView() {
        dismiss(animated: true)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let view = parent?.view, view.frame.origin.y >= 0 else { return }
        UIView.animate(withDuration: 0.3) {
            view.frame.origin.y -= notification.keyboardHeight - 16
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let view = parent?.view, view.frame.origin.y < 0 else { return }
        view.frame.origin.y = 0
    }
}

extension ReturnOrderViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
    }
}

extension Notification {
    public var keyboardRect: CGRect  {
        (userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
         as? NSValue)?.cgRectValue ?? .zero
    }
    
    public var keyboardHeight: CGFloat {
        (userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
         as? NSValue)?.cgRectValue.height ?? 0
    }
}

