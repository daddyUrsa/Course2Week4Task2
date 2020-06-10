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
        let slideAnimationFromLeft = CATransition()
/*
        var animations = [CATransition]()

        let animationMove = CATransition()
        animationMove.type = CATransitionType.moveIn
        animations.append(animationMove)

        let animationFade = CATransition()
        animationFade.type = CATransitionType.fade
        animations.append(animationFade)

        let group = CAAnimationGroup()
        group.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        group.duration = 2.0
        group.animations = animations
*/
//        textLabel.layer.add(group, forKey: nil)
        textLabel.text = textLabel.text == "Initial text" ? "Slide!" : "Initial text"
    }

}
