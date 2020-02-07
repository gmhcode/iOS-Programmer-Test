//
//  AnimationViewController.swift
//  iOSTest
//
//  Created by HannDev LLC on 9/9/19.
//  Copyright © 2019 HannDev LLC. All rights reserved.
//

import UIKit
import AVKit
class AnimationViewController: UIViewController {
    
    @IBOutlet weak var hannDev: UITextField!
    @IBOutlet weak var fadeButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var player : AVPlayer?
    var playerLayer : AVPlayerLayer?
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1 1) Make the UI look like it does in the mock-up.
     *
     * 1 2) UITextField with text 'HannDev, LLC' should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 1 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     **/
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
        
        hannDev.alpha = 0
        fadeButton.setTitle("Fade In", for: .normal)
        playVideo()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        self.playerLayer?.position = containerView.center
//        self.playerLayer?.
    }
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        print(navigationController?.viewControllers.count as Any)
        self.navigationController?.popViewController(animated: true)
    }
    
    /// This handles the movement of the UITextField
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: hannDev)
        guard let gestureView = sender.view else {print("❇️♊️>>>\(#file) \(#line): guard let failed<<<"); return}
        
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
        )
        
        
        sender.setTranslation(.zero, in: hannDev)
        
        
    }
    /// Handles the Fade
    @IBAction func didPressFade(_ sender: Any) {
        
        if hannDev.alpha == 0 {
            UIView.animate(withDuration: 1) {
                self.fadeButton.setTitle("Fade Out", for: .normal)
                self.hannDev.alpha = 1
                self.playerLayer?.isHidden = false
                self.player?.play()
                
            }
        }else {
            UIView.animate(withDuration: 1) {
                self.fadeButton.setTitle("Fade In", for: .normal)
                self.hannDev.alpha = 0
                self.playerLayer?.isHidden = true
                self.player?.pause()
                
            }
        }
    }
    
    func playVideo() {
        if let path = Bundle.main.path(forResource: "videoplayback", ofType: "mp4") {
            
            self.player = AVPlayer(url: URL(fileURLWithPath: path))
            self.playerLayer = AVPlayerLayer(player: player)
            self.containerView.layer.addSublayer(playerLayer ?? AVPlayerLayer())
            self.playerLayer?.frame.size.height = self.containerView.bounds.height * 1.5
            self.playerLayer?.frame.size.width = self.containerView.bounds.width * 1.5
            
            
            
            self.playerLayer?.isHidden = true
        }
    }
}
