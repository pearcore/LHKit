//
//  LHKit.swift
//  BasicProduct
//
//  Created by Apple on 2022/11/17.
//
import UIKit
public class LHKit {
    public static let cent = UIScreen.main.bounds.width/100
    public static let rpx = UIScreen.main.bounds.width/750
    
    public static func HEXCOLOR(c: UInt64) -> (UIColor) {
        let redValue = CGFloat((c & 0xFF0000) >> 16)/255.0
        let greenValue = CGFloat((c & 0xFF00) >> 8)/255.0
        let blueValue = CGFloat(c & 0xFF)/255.0
        return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0);
    }
    
    public static func delayToDo(_ delay:Double,doSomething: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
            execute: doSomething
        )
    }
    
    public static func ftSize(size: CGFloat) -> (UIFont) {
        return UIFont.systemFont(ofSize: CGFloat(size))
    }
    
    public static func changeFontBold(_ label:UILabel) {
        label.font = UIFont(name: "Helvetica-bold", size: (label.font?.pointSize)! )
    }
    
    public static func stateNavSpace (_ vc:UIViewController)->CGFloat {
        return stateSpace + navSpace(vc)
    }
    
    public static func TopBottomSpace(_ vc:UIViewController)->CGFloat {
        var rt:CGFloat = 0
        let navs = navSpace(vc)
        let states = stateSpace
        let tabs = tabSpace(vc)
        rt = UIScreen.main.bounds.height - (navs + states + tabs)
        return rt
    }
    
    public static func tabSpace(_ vc:UIViewController)->CGFloat {
        var rt:CGFloat = 0
        if vc.tabBarController != nil {
            rt = vc.tabBarController!.tabBar.frame.height
        }
        return rt
    }
    
    public static var stateSpace:CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    public static func navSpace (_ vc:UIViewController)->CGFloat {
        var rt :CGFloat = 0
        if vc.navigationController?.navigationBar.frame.height != nil {
            rt = (vc.navigationController?.navigationBar.frame.height)!
        }
        return rt
    }
}

// extensions

extension UIImage {
    public class func imageWithColor(color:UIColor,size:CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

