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
        textLabel.textColor = .green
        textLabel.text = "Sliding!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.fadeInOut()
            self.textLabel.textColor = .orange
            self.textLabel.text = "Inital text"
        }
    }
}

extension CATransitionController {
    func slideFromLeft() {
        let slideAnimationFromLeft = CATransition()

        slideAnimationFromLeft.type = CATransitionType.moveIn
        slideAnimationFromLeft.subtype = CATransitionSubtype.fromLeft
        slideAnimationFromLeft.duration = 1.0
        slideAnimationFromLeft.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        slideAnimationFromLeft.fillMode = CAMediaTimingFillMode.forwards

        textLabel.layer.add(slideAnimationFromLeft, forKey: "slideAnimationFromLeft")
    }

    func fadeInOut() {
        let fadeAnimation = CATransition()
        fadeAnimation.type = CATransitionType.fade
        fadeAnimation.duration = 1.0
        fadeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)

        textLabel.layer.add(fadeAnimation, forKey: "fadeAnimation")
    }
}
