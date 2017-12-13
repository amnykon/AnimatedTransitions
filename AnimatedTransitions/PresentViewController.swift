import Foundation

extension UIViewController {
  public func present(_ viewControllerToPresent: UIViewController, transition: UIViewControllerTransitioningDelegate) {
    viewControllerToPresent.modalPresentationStyle = .custom
    viewControllerToPresent.transitioningDelegate = SlideLeftTransitioningDelegate.shared
    present(viewControllerToPresent, animated: true)
  }
}
