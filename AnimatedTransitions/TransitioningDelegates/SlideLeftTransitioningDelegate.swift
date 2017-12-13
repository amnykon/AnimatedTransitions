import Foundation

public class SlideLeftTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
  public static let shared = SlideLeftTransitioningDelegate()

  public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return SlideLeftAnimationController()
  }

  public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return SlideRightAnimationController()
  }

  private override init() {
    super.init()
  }
}
