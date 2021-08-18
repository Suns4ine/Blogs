//
//  AnotherExtension.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//

import Foundation
import UIKit

/// Если у  объекта меньше 3 (маленьких расширений) расширений, то он будет лежать тут

extension CALayer {
  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let maskPath = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))

    let shape = CAShapeLayer()
    shape.path = maskPath.cgPath
    mask = shape
  }
}

public extension UIViewController {

   /// Adds child view controller to the parent.
   ///
   /// - Parameter child: Child view controller.
   func add(_ child: UIViewController) {
       addChild(child)
       view.addSubview(child.view)
       child.didMove(toParent: self)
   }

   /// It removes the child view controller from the parent.
   func remove() {
       guard parent != nil else {
           return
       }
       willMove(toParent: nil)
       removeFromParent()
       view.removeFromSuperview()
   }
}
