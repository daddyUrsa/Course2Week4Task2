//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CABasicAnimationController: UIViewController {
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var cyanView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapOrangeView = UITapGestureRecognizer(target: self, action: #selector(orangeViewTapped))
        orangeView.addGestureRecognizer(tapOrangeView)

        let tapCyanView = UITapGestureRecognizer(target: self, action: #selector(cyanViewTapped))
        cyanView.addGestureRecognizer(tapCyanView)

        let tapBlueView = UITapGestureRecognizer(target: self, action: #selector(blueViewTapped))
        blueView.addGestureRecognizer(tapBlueView)

        let tapGreenView = UITapGestureRecognizer(target: self, action: #selector(greenViewTapped))
        greenView.addGestureRecognizer(tapGreenView)
    }

    @objc func orangeViewTapped() {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.duration = 1.0
        animation.fromValue = 0
        animation.toValue = 50
        orangeView.layer.add(animation, forKey: "cornerRadius")
        orangeView.layer.cornerRadius = 50
    }

    @objc func cyanViewTapped() {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.duration = 1.0
        animation.fromValue = 1.0
        animation.toValue = 0.0
        cyanView.layer.add(animation, forKey: kCATransition)
        cyanView.layer.opacity = 0.0
    }

    @objc func blueViewTapped() {
        var animations = [CABasicAnimation]()
        let radian = 315 * Double.pi / 180
        
        let animateMove = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animateMove.fromValue = blueView.center
        animateMove.toValue = CGPoint(x: cyanView.center.x, y: blueView.center.y)
        animations.append(animateMove)
        
        let animateRotation = CABasicAnimation(keyPath: "transform.rotation")
        animateRotation.fromValue = 0
        animateRotation.toValue = radian
        animations.append(animateRotation)
        
        let group = CAAnimationGroup()
        group.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        group.duration = 2.0
        group.animations = animations
        blueView.layer.add(group, forKey: nil)
        blueView.layer.position = CGPoint(x: cyanView.center.x, y: blueView.center.y)
        blueView.transform = CGAffineTransform(rotationAngle: CGFloat(radian))
    }

    @objc func greenViewTapped() {
        
        var animations = [CABasicAnimation]()
        
        let animateMove = CABasicAnimation(keyPath: "position")
        animateMove.fromValue = greenView.center
        animateMove.toValue = view.center
        animations.append(animateMove)
        
        let animateScale = CABasicAnimation(keyPath: "transform.scale")
//        animateScale.duration = 1.0
        animateScale.fromValue = 1
        animateScale.toValue = 1.5
        animations.append(animateScale)
        
        let animateBackgroundColor = CABasicAnimation(keyPath: "backgroundColor")
        animateBackgroundColor.fromValue = UIColor.green.cgColor
        animateBackgroundColor.toValue = UIColor.magenta.cgColor
        animations.append(animateBackgroundColor)
        
        let group = CAAnimationGroup()
        group.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        group.duration = 1.0
        group.animations = animations
        group.repeatCount = 2
        group.autoreverses = true
        greenView.layer.add(group, forKey: nil)
     }
}

