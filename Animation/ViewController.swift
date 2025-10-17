//
//  ViewController.swift
//  practice
//
//  Created by mac on 31/7/2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var animationView:UIImageView!
    @IBOutlet weak var animation:UIImageView!
    @IBOutlet weak var animationT:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func animationbtnTapped (_ sender:Any){
        UIView.animate(withDuration: 1, delay: 0.5, animations: {
            self.animationView.backgroundColor = .red
            self.animationView.frame.size.width += 10
            self.animationView.frame.size.height += 10
        })
        {_ in
            UIView.animate(withDuration: 1, delay: 0.25, options: .curveLinear){
                self.animationView.backgroundColor = .black
                self.animationView.frame.origin.y += 150
            }
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.2, options: [.repeat, .autoreverse], animations: {
                self.animationView.backgroundColor = .yellow
                self.animationView.alpha = 0.5
                self.animationView.center.x = self.view.bounds.width - 150
            },completion: nil)
            UIView.animateKeyframes(withDuration: 4, delay: 0,options: [.repeat,.autoreverse] ,animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {self.animation.backgroundColor = .magenta})
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {self.animation.alpha = 0.5})
                UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {self.animation.center.x = self.view.bounds.width - 100})
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {self.animation.center.x = self.view.bounds.width - 200})
                })
            let animate = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut){
//                self.animationT.backgroundColor = .blue
                self.animationT.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
                self.animationT.center = self.view.center
            }
            animate.startAnimation()
            
            UIView.animateKeyframes(withDuration: 7, delay: 0.2, options: [.calculationModeLinear, .autoreverse], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                    self.animationT.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                    self.animationT.center = CGPoint(x: self.view.bounds.width, y: self.view.bounds.height)
                }
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                    self.animationT.center = .zero
                }
            })
     }
    }
}
