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
        UIView.animate(withDuration: 1.0, animations: {
            self.orangeView.layer.cornerRadius = 50
        })
    }

    @objc func cyanViewTapped() {
        UIView.animate(withDuration: 1.0, animations: {
            self.cyanView.layer.opacity = 0.0
        })
    }

    @objc func blueViewTapped() {
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear, animations: {
            self.blueView.center.x += 275
            self.blueView.transform = CGAffineTransform(rotationAngle: 2.4)
        })
        animator.startAnimation()
    }

    @objc func greenViewTapped() {
         UIView.animate(withDuration: 1.0, animations: {
            self.greenView.center = self.view.center
            self.greenView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.greenView.backgroundColor = .magenta
         })
     }



        
}
