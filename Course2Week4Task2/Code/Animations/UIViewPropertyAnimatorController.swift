//
//  UIViewPropertyAnimatorController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewPropertyAnimatorController: UIViewController {
    
    var animator: UIViewPropertyAnimator!
    @IBOutlet weak var animationView: UIView!
    
    @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            animationView.backgroundColor = .orange
            animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear, animations: {
                self.animationView.center.x += 300.0
                self.animationView.transform = CGAffineTransform(scaleX: 3, y: 3)
                self.animationView.transform = CGAffineTransform(rotationAngle: .pi)
            })
            animator.addCompletion { _ in
                self.animationView.backgroundColor = .red
            }
            animator.pauseAnimation()
//            print("Began")
        case .changed:
            animator.fractionComplete = recognizer.translation(in: view).x / view.bounds.size.width
            animator.pauseAnimation()

//            print("Changed")
        case .ended:
            print("animationView x = \(animationView.layer.position.x - 300), у = \(animationView.layer.position.y), View x = \(view.center.x))")
            if (animationView.layer.position.x - 300) < view.center.x {
                animator.isReversed = true
                animator.startAnimation()
                print("Меньше")
            } else {
                animator.stopAnimation(true)
                print("Больше")
            }

            print(Double(animationView.center.x - 300) < Double(view.center.x))
//            print("End")
        default:
            ()
        }
        
    }
}
