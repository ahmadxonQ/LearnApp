//
//  SwiftUIView.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 23/06/24.
//

import SwiftUI
import UIKit
struct Colors: View {
    let rect = RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
    var body: some View {
        ZStack{
            rect
                .fill(
                    //Color.primary
                    //Color(UIColor.systemGreen)
                    Color(.init(red: 0, green: 0.32, blue: 0.57, alpha: 1))
                )
                .frame(width: 300, height: 200)
            
            VStack{
                Text("Hello, world")
                Text("Hello, world2")
                Button("Tap me", action: {
                   rect
                        .fill(Color(uiColor: .systemGreen))
                    print("helloworld")
                })
            }
        }
        
    }
}

#Preview {
    Colors()
}

class MyView: UIViewController {
    let color = UIHostingController(rootView: Colors())
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        view.addSubview(color.view)
        color.view.translatesAutoresizingMaskIntoConstraints = false
        color.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        color.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
}

