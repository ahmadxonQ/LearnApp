//
//  BottomSheetController.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 20/06/24.
//

import UIKit
import FloatingPanel

class BottomSheetController: FloatingPanelController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = SurfaceAppearance()
        // Define shadows
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: 16)
        shadow.radius = 100
        shadow.spread = 16
        appearance.shadows = [shadow]

        // Define corner radius and background color
        appearance.cornerRadius = 8.0
        appearance.backgroundColor = .white
        
        isRemovalInteractionEnabled = true
        backdropView.dismissalTapGestureRecognizer.isEnabled = true
        surfaceView.appearance = appearance
    }
}
