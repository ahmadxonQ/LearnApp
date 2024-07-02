//
//  ParentViewController.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 14/06/24.
//

import UIKit
import FloatingPanel
import Colors
class ParentViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.center = view.center
        view.addSubview(button)
        button.backgroundColor = .systemGreen
        button.setTitle("Show Panel", for: .normal)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        
        let button2 = UIButton()
        button2.frame = CGRect(x: 200, y: 300, width: 100, height: 50)
        view.addSubview(button2)
        button2.backgroundColor = .systemGreen
        
        button2.addTarget(self, action: #selector(buttonTap2), for: .touchUpInside)
        button.backgroundColor = .red1
        button2.setTitle("@Panel", for: .normal)
       
       
    }
    
    @objc func buttonTap() {
        let fpc = FloatingPanelController()
        let contentVC = ReturnOrderViewController()
        fpc.set(contentViewController: contentVC)
        fpc.isRemovalInteractionEnabled = true
        let layout = CustomPanelLayout()
        layout.setsize(size: 0.3)
        fpc.layout = layout
        
        present(fpc, animated: true, completion: nil)
    }
    
    @objc func buttonTap2() {
        let sheet = BottomSheetController()
        let content = ReturnOrderViewController()
        sheet.set(contentViewController: content)
        let layout = CustomPanelLayout()
        layout.setsize(size: 0.1)
        sheet.layout = layout
        present(sheet, animated: true, completion: nil)
    }
    
    @objc func backtap(){
        print("back tap")
        dismiss(animated: true)
    }
}

class CustomPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .half
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [:]
    
    func setsize(size: CGFloat) {
        anchors = [
            .half: FloatingPanelLayoutAnchor(fractionalInset: size, edge: .bottom, referenceGuide: .safeArea)
        ]
    }
    
    func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
           return 0.5
       }
}





 
