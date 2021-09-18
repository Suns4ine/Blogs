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

extension Array where Element == String {
    
    func returnEnumerationString() -> String {
        
        let stringArray2 = self.map { String($0) }
        let string = stringArray2.joined(separator: ", ")
        
        return string
    }
}


func getImage(from string: String) -> UIImage? {
    //2. Get valid URL
    guard let url = URL(string: string)
        else {
            print("Unable to create URL")
            return nil
    }

    var image: UIImage? = nil
    do {
        //3. Get valid data
        let data = try Data(contentsOf: url, options: [])

        //4. Make image
        image = UIImage(data: data)
    }
    catch {
        print(error.localizedDescription)
    }

    return image
}


func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
