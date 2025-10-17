import UIKit

class StackViewController: UIViewController {
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var july: UILabel!
    @IBOutlet weak var text: UITextView!
    
    private var animatedLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animateKeyframes(withDuration: 2, delay: 0.25, options: [.repeat, .autoreverse], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.stack.center.x = self.view.bounds.width - 190
                self.stack.frame.origin.y = 211
                self.july.frame.origin.y = 160
                self.text.frame.origin.y = 230
            }
            
        })
        animationLayer()
    }
    private func animationLayer() {
        animatedLayer = CALayer()
        animatedLayer.frame = CGRect(x: 150, y: 500, width: 100, height: 100)
        animatedLayer.cornerRadius = 10
        animatedLayer.backgroundColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(animatedLayer)
        
        applyAnimation(to: animatedLayer)
    }
    
    private func applyAnimation(to layer: CALayer) {
        let newlayer = CALayer()
        newlayer.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        newlayer.backgroundColor = UIColor.black.cgColor
        newlayer.cornerRadius = 10
        newlayer.shadowOpacity = 0.3
        newlayer.shadowOffset = CGSize(width: 8, height: 10)
        newlayer.shadowRadius = 5
        newlayer.shadowColor = UIColor.red.cgColor
        animatedLayer.addSublayer(newlayer)
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.fromValue = 1.0
        scale.toValue = 2.0

        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = 0
        rotate.toValue = CGFloat.pi * 2

        let group = CAAnimationGroup()
        group.animations = [scale, rotate]
        group.duration = 2.0
        group.repeatCount = .infinity
        group.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 1.0, 0.5, 1.0)
        group.autoreverses = true

        layer.add(group, forKey: "transformAnimation")
    }
//        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: view)
//        moveLayerToPosition(location)
//    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: view)
        
        let newposition = CGPoint(x: animatedLayer.position.x, y: location.y)
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.fromValue = animatedLayer.presentation()?.position ?? animatedLayer.position
        moveAnimation.toValue = newposition
        moveAnimation.duration = 0.1
        moveAnimation.isRemovedOnCompletion = false
        moveAnimation.fillMode = .removed
        
        animatedLayer.add(moveAnimation, forKey: "moveAnimation")
        animatedLayer.position = newposition
    }
    
//    private func moveLayerToPosition(_ position: CGPoint) {
//        guard animatedLayer != nil else { return }
// 
    //        CATransaction.begin()
    //        CATransaction.setDisableActions(true)
    //        animatedLayer.position = position
    //        CATransaction.commit()
//    }
}
