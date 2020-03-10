//
//  GameViewController.swift
//  8l_NikishinRoman
//
//  Created by Roman on 09.03.2020.
//  Copyright © 2020 Roman Nikishin. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let scene = GameScene(size: view.bounds CGRect(x: 0, y: 40, width: view!.frame.maxX, height: view!.frame.maxY))
        let scene = GameScene(size: view.bounds.size)
        
        let skView = view as! SKView
        
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
}
