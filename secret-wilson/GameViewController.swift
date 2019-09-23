//
//  GameViewController.swift
//  secret-wilson
//
//  Created by Ron De Benedetti on 9/19/19.
//  Copyright © 2019 updogma. All rights reserved.
//

import UIKit
//import SpriteKit
//import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
