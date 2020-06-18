//
//  UIViewAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var flipButton: UIButton!

    var rotateCounter: Int = 1

    @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
        moveAndRotate()
    }
    
    @IBAction func flipButtonTapHandler(sender: UIButton) {
        flipView()
    }
}

extension UIViewAnimationController {

    func moveAndRotate() {
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseOut, animations: {
            self.animationView.center.x += self.view.bounds.width - self.animationView.bounds.width
            self.animationView.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: .none)
    }
    func flipView() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            switch self.rotateCounter {
            case 1:
                self.view.transform = CGAffineTransform(rotationAngle: .pi)
                self.flipButton.transform = CGAffineTransform(rotationAngle: .pi)
            case 2:
                self.view.transform = CGAffineTransform.identity
                self.flipButton.transform = CGAffineTransform.identity
            default:
                ()
            }
        }, completion: .none)

        rotateCounter += 1
        if rotateCounter > 2 {
            rotateCounter = 1
        }
    }
}
