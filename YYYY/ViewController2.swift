//
//  ViewController2.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 14/06/24.
//

import Foundation
import UIKit

import UIKit
import FloatingPanel

class ViewController: UIViewController, FloatingPanelControllerDelegate {
    var floatingPanelController: FloatingPanelController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFloatingPanel()
    }
    
    private func setupFloatingPanel() {
        floatingPanelController = FloatingPanelController()
        floatingPanelController.delegate = self
        
        let bottomSheetVC = BottomSheetViewController()
        floatingPanelController.set(contentViewController: bottomSheetVC)
        
        floatingPanelController.track(scrollView: bottomSheetVC.view)
        
        floatingPanelController.addPanel(toParent: self)
        
        floatingPanelController.surfaceView.appearance.cornerRadius = 20.0
        floatingPanelController.surfaceView.appearance.backgroundColor = .white
    }
    
    // FloatingPanelControllerDelegate
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout {
        return HalfFloatingPanelLayout()
    }
}

class HalfFloatingPanelLayout: FloatingPanelLayout {
    var initialPosition: FloatingPanelPosition {
        return .half
    }
    
    var supportedPositions: Set<FloatingPanelPosition> {
        return [.half, .full]
    }
    
    func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        switch position {
        case .half: return 300.0
        case .full: return 600.0
        default: return nil
        }
    }
}
