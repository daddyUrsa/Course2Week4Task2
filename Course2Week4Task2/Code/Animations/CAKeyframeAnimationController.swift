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
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: passcodeTextField.center.x - 6, y: passcodeTextField.center.y)
        animation.toValue = CGPoint(x: passcodeTextField.center.x + 6, y: passcodeTextField.center.y)
        passcodeTextField.layer.add(animation, forKey: "position")
    }
    
    func movingPath() {
        let animation = CAKeyframeAnimation(keyPath: #keyPath(CALayer.position))
        animation.path = sinPath()
//        orangeView.frame.contains(CGPoint(x: sinPath().currentPoint + orangeView.center.x, y: <#T##Double#>)) = sinPath().currentPoint + orangeView.center.x
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
