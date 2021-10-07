//
//  AnotherExtension.swift
//  Blogs
//
//  Created by Vyacheslav Pronin on 13.08.2021.
//

import Foundation
import UIKit

//MARK: Если у объекта меньше 3 (маленьких расширений) расширений, то он будет лежать тут

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

private var pTouchAreaEdgeInsets: UIEdgeInsets = .zero

extension UIButton {
    var touchAreaEdgeInsets: UIEdgeInsets {
        get {
            if let value = objc_getAssociatedObject(self, &pTouchAreaEdgeInsets) as? NSValue {
                var edgeInsets: UIEdgeInsets = .zero
                value.getValue(&edgeInsets)
                return edgeInsets
            }
            else {
                return .zero
            }
        }
        set(newValue) {
            var newValueCopy = newValue
            let objCType = NSValue(uiEdgeInsets: .zero).objCType
            let value = NSValue(&newValueCopy, withObjCType: objCType)
            objc_setAssociatedObject(self, &pTouchAreaEdgeInsets, value, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if UIEdgeInsetsEqualToEdgeInsets(self.touchAreaEdgeInsets, .zero) || !self.isEnabled || self.isHidden {
            return super.point(inside: point, with: event)
        }

        let relativeFrame = self.bounds
        let hitFrame = relativeFrame.inset(by: self.touchAreaEdgeInsets)

        return hitFrame.contains(point)
    }
}

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

fileprivate extension UIScrollView {
    func screenshot() -> UIImage? {
            let savedContentOffset = contentOffset
            let savedFrame = frame
            defer {
                contentOffset = savedContentOffset
                frame = savedFrame
            }

            contentOffset = .zero
            frame = CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height)

            let image = UIGraphicsImageRenderer(bounds: CGRect(origin: .zero, size: contentSize)).image { renderer in
                let context = renderer.cgContext
                layer.render(in: context)
            }

            return image
        }
}

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
        
        self.rightView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.rightViewMode = .always
    }
}

extension Bool {
    static let isSmallScreen =  UIScreen.main.bounds.height <= 667
}
