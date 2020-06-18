//
//  UIKitDynamicController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIKitDynamicController: UIViewController {
    
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var animationView: UIView!

    var anchorPoint: CGPoint!
    var attachment: UIAttachmentBehavior!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()

        let pan = UIPanGestureRecognizer(target: self, action: #selector(addPan))
        anchorView.addGestureRecognizer(pan)

        // Точка присоединения к родительскому объекту.
        anchorPoint = anchorView.center

        // Связующий объект
        attachment = UIAttachmentBehavior(item: animationView, attachedToAnchor: anchorPoint)
        attachment.length = 150 // Длина связи
        attachment.frequency = 1 // Хер знает как влияет
        attachment.damping = 4 // Отпруживнивание

        // Создаю анимацию и добавляю поведение связи
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(attachment)

        // Определяю гравитацию и добавляю поведение гравитации
        gravity = UIGravityBehavior(items: [animationView])
        animator.addBehavior(gravity)


    }
    
}

extension UIKitDynamicController {


    @objc func addPan(pan: UIGestureRecognizer) {
        attachment.anchorPoint = pan.location(in: view)
        anchorView.center = pan.location(in: view)
    }

}
