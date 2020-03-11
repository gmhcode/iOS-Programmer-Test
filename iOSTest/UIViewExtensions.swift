//
//  UIViewExtensions.swift
//  iOSTest
//
//  Created by Greg Hughes on 2/8/20.
//  Copyright © 2020 D&ATechnologies. All rights reserved.
//

import UIKit

extension UIView {
    
    
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.90
        pulse.toValue = 1
        pulse.initialVelocity = 0.5
        layer.add(pulse, forKey: nil)
    }
    
    
    
}
