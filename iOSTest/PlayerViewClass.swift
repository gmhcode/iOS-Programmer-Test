//
//  PlayerViewClass.swift
//  iOSTest
//
//  Created by Greg Hughes on 2/8/20.
//  Copyright © 2020 D&ATechnologies. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerViewClass : UIView {
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var playerLayer : AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    var player : AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    
}
