//
//  CAKeyframeAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CAKeyframeAnimationController: UIViewController {
    
    @IBOutlet weak var passcodeTextField: UITextField!
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var startShakeAnimationButton: UIButton!
    @IBOutlet weak var startSinAnimationButton: UIButton!
    
    @IBAction func shakeAnimationTapHandler(sender: UIButton) {
        shake()
    }

    @IBAction func sinAnimationTapHandler(sender: UIButton) {
        movingPath()
    }

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSinPath()
    }
    
    func shake() {
        let animationPosition = CAKeyframeAnimation()
        let yPoint = 0
        let pathArray = [CGPoint(x: 0, y: yPoint), CGPoint(x: 10, y: yPoint), CGPoint(x: -10, y: yPoint), CGPoint(x: 10, y: yPoint), CGPoint(x: -5, y: yPoint), CGPoint(x: 5, y: yPoint), CGPoint(x: -5, y: yPoint), CGPoint(x: 0, y: yPoint)]
        
        animationPosition.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.8, 1]
        animationPosition.duration = 0.4
        animationPosition.isAdditive = true
        animationPosition.keyPath = "position"
        animationPosition.values = pathArray

        passcodeTextField.layer.add(animationPosition, forKey: "position")
    }
    
    func movingPath() {	
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = sinPath()
        animation.rotationMode = CAAnimationRotationMode.rotateAuto
        animation.duration = 6.0
        animation.repeatCount = .infinity

        orangeView.layer.add(animation, forKey: "position")
    }
}

extension CAKeyframeAnimationController {
    private func showSinPath() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = sinPath()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(shapeLayer)
    }
    
    private func sinPath() -> CGPath {
        let startPoint = orangeView.center
        let width = self.view.bounds.width - 2 * startPoint.x
        let height = self.view.bounds.height / 6.0
        return CGPath.sinPath(startPoint: startPoint, width: width, height: height, periods: 1.5)
    }
}
