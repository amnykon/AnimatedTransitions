import Foundation
import UIKit

class SlideRightAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.5
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard
      let fromVC = transitionContext.viewController(forKey: .from),
      let toVC = transitionContext.viewController(forKey: .to)
    else {
        return
    }

    let containerView = transitionContext.containerView
    let finalFrame = transitionContext.finalFrame(for: toVC)

    if toVC.view.superview == nil {
      containerView.addSubview(toVC.view)
    }

    toVC.view.layer.transform = CATransform3DMakeTranslation(-finalFrame.width, 0, 0)

    UIView.animateKeyframes(
      withDuration: transitionDuration(using: transitionContext),
      delay: 0,
      options: .calculationModeCubic,
      animations: {
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
          toVC.view.layer.transform = CATransform3DIdentity
          fromVC.view.layer.transform = CATransform3DMakeTranslation(finalFrame.width, 0, 0)
        }
      },
      completion: { _ in
        toVC.view.layer.transform = CATransform3DIdentity
        fromVC.view.layer.transform = CATransform3DIdentity
        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
    })
  }
}

