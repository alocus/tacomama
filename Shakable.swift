//
//  Shakable.swift
//  TocaMama
//
//  Created by Michael Dunn on 2016-10-05.
//  Copyright © 2016 Michael Dunn. All rights reserved.
//

import UIKit

protocol Shakable {}


extension Shakable where Self: UIView {
    func shake() {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 0.5
        anim.repeatCount = 5
        anim.autoreverses = true
        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        anim.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        layer.add(anim, forKey: "position")
    }
}
