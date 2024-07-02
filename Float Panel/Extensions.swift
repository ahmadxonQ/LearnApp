//
//  Extensions.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 14/06/24.
//

import UIKit

//Autoresize mask
extension UIView {
    var autoResize: Bool {
        get { return translatesAutoresizingMaskIntoConstraints }
        set { translatesAutoresizingMaskIntoConstraints = newValue}
    }
}
//Constraints
extension UIView {
    var top: NSLayoutYAxisAnchor {
        return topAnchor
    }
    var left: NSLayoutXAxisAnchor {
        return leftAnchor
    }
    var bottom:NSLayoutYAxisAnchor {
        return bottomAnchor
    }
    var right: NSLayoutXAxisAnchor {
        return rightAnchor
    }
    var x: NSLayoutXAxisAnchor {
        return centerXAnchor
    }
    var y: NSLayoutYAxisAnchor {
        return centerYAnchor
    }
    var safeTop: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.topAnchor
    }
    var safeBottom: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.bottomAnchor
    }
    var height: NSLayoutDimension {
        return heightAnchor
    }
    var width: NSLayoutDimension {
        return widthAnchor
    }
}
//Is active layout constraints
extension NSLayoutConstraint {
    @discardableResult
    func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
}
//Textfield left padding
extension UITextField {
    func leftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
//Rectangle views corners
extension CACornerMask {
    static let topLeft = CACornerMask.layerMinXMinYCorner
    static let topRight = CACornerMask.layerMaxXMinYCorner
    static let bottomRight = CACornerMask.layerMaxXMaxYCorner
    static let bottomLeft = CACornerMask.layerMinXMaxYCorner
}
