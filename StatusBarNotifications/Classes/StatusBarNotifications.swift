//
//  StatusBarNotifications.swift
//  Pods
//
//  Created by Michal Jach on 5/26/17.
//
//

import UIKit

/**
 *  Animations Enum
 *
 *  - parameter fade
 *  - parameter slideFromTop
 *  - parameter slideFromBottom
 *  - parameter slideFromLeft
 */
public enum Animation {
    case fade
    case slideFromTop
    case slideFromBottom
    case slideFromLeft
}

/**
 *  Main StatusBarNotifications Class
 *
 */
public class StatusBarNotifications: NSObject {
    /**
     *  Show method
     *
     *  - parameter withText: String to show
     *  - parameter animation: animation to use
     *  - parameter backgroundColor: color of notification background (default blue)
     *  - parameter textColor: color of text (default white)
     */
    public static func show(withText: String, animation: Animation = .fade, backgroundColor: UIColor = .blue, textColor: UIColor = .white) {
        if let statusBar = UIApplication.shared.statusBarView {
            statusBar.clipsToBounds = true
            let notificationView = UIView(frame: statusBar.frame)
            notificationView.backgroundColor = backgroundColor
            notificationView.clipsToBounds = true
            
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 0, width: statusBar.frame.width, height: notificationView.frame.height)
            label.text = withText
            label.textColor = textColor
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 13.0)
            
            notificationView.addSubview(label)
            
            switch animation {
            case .fade:
                notificationView.alpha = 0
                UIView.animate(withDuration: 0.3, animations: {
                    notificationView.alpha = 1.0
                }, completion: { finished in
                    UIView.animate(withDuration: 0.3, delay: 1.0, options: .curveLinear, animations: {
                        notificationView.alpha = 0.0
                    }, completion: { finished in
                        notificationView.removeFromSuperview()
                    })
                })
            case .slideFromTop:
                notificationView.transform = CGAffineTransform(translationX: 0, y: -notificationView.frame.height)
                UIView.animate(withDuration: 0.3, animations: {
                    notificationView.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: { finished in
                    UIView.animate(withDuration: 0.3, delay: 1.0, options: .curveLinear, animations: {
                        notificationView.transform = CGAffineTransform(translationX: 0, y: -notificationView.frame.height)
                    }, completion: nil)
                })
            case .slideFromBottom:
                notificationView.transform = CGAffineTransform(translationX: 0, y: notificationView.frame.height)
                UIView.animate(withDuration: 0.3, animations: {
                    notificationView.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: { finished in
                    UIView.animate(withDuration: 0.3, delay: 1.0, options: .curveLinear, animations: {
                        notificationView.transform = CGAffineTransform(translationX: 0, y: notificationView.frame.height)
                    }, completion: { finished in
                        notificationView.removeFromSuperview()
                    })
                })
            case .slideFromLeft:
                notificationView.transform = CGAffineTransform(translationX: -notificationView.frame.width, y: 0)
                UIView.animate(withDuration: 0.3, animations: {
                    notificationView.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: { finished in
                    UIView.animate(withDuration: 0.3, delay: 1.0, options: .curveLinear, animations: {
                        notificationView.transform = CGAffineTransform(translationX: -notificationView.frame.width, y: 0)
                    }, completion: { finished in
                        notificationView.removeFromSuperview()
                    })
                })
            }
            
            statusBar.addSubview(notificationView)
        }
    }
}

/**
 *  Extension to get statusBar object
 *
 *  - return: statusBar UIView
 */
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
