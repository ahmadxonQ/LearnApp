//
//  Hello.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 31/05/24.
//

import SpriteKit
import GameplayKit

class AnimationViewController: UIViewController {
    private lazy var animationView = SKView()
    
    override func loadView() {
        super.loadView()
        view.addSubview(animationView)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .systemRed
        guard animationView.scene == nil else {return}
        let scene = makeScene()
        animationView.frame.size = scene.size
        animationView.presentScene(scene)
        addEmoji(to: scene)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animationView.center.x = view.bounds.midX
        animationView.center.y = view.bounds.midY
        
    }
    
}

extension AnimationViewController {
    func animateNodes(_ nodes: [SKNode]) {
        for (index, node) in nodes.enumerated() {
            node.run(.sequence([
                .wait(forDuration: TimeInterval(index) * 0.2),
                .repeatForever(.sequence([
                    .scale(to: 1.5, duration: 0.3),
                    .scale(to: 1, duration: 0.3),
                    .wait(forDuration: 2)
                ]))
            ]))
        }
    }
}

extension AnimationViewController {
    func makeScene() -> SKScene {
        let minimumDimension = min(view.frame.width, view.frame.height)
        let size = CGSize(width: minimumDimension, height: minimumDimension)
        let scene = SKScene(size: size)
        scene.backgroundColor = .white
        return scene
    }
}


extension AnimationViewController {
    func addEmoji(to scene: SKScene) {
        let allEmoji: [Character] = ["🌯", "🌮", "🍔", "🍕"]
        let distance = floor(scene.size.width / 4)
        for (index, emoji) in allEmoji.enumerated() {
            let node = SKLabelNode()
            node.renderEmoji(emoji)
            node.position.y = floor(scene.size.height / 2)
            node.position.x = distance * (CGFloat(index) + 0.5)
            scene.addChild(node)
        }
        animateNodes(scene.children)
    }
}



extension SKLabelNode {
    func renderEmoji(_ emoji: Character) {
        fontSize = 50
        text = String(emoji)
        verticalAlignmentMode = .center
        horizontalAlignmentMode = .center
    }
}
