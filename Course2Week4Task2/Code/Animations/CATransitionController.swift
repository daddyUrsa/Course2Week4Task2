//
//  CATransitionController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CATransitionController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!

    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        slideFromLeft()
    }
}

extension CATransitionController {
    func slideFromLeft() {
        let slideAnimationFromLeft = CATransition()
        slideAnimationFromLeft.delegate = self
        slideAnimationFromLeft.type = CATransitionType.moveIn
        slideAnimationFromLeft.subtype = CATransitionSubtype.fromLeft
        slideAnimationFromLeft.duration = 1.0
        slideAnimationFromLeft.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        slideAnimationFromLeft.fillMode = CAMediaTimingFillMode.forwards
        
        textLabel.textColor = .green
        textLabel.text = "Sliding!"
        textLabel.layer.add(slideAnimationFromLeft, forKey: "slideAnimationFromLeft")
    }
}

extension CATransitionController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        let fadeAnimation = CATransition()
        fadeAnimation.type = .fade
        fadeAnimation.duration = 1.0
        fadeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)

        textLabel.textColor = .orange
        textLabel.text = "Inital text"
        textLabel.layer.add(fadeAnimation, forKey: nil)
    }
}
