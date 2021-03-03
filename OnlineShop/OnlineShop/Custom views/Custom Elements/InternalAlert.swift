//
//  InternalAlert.swift
//  OnlineShop
//
//  Created by Arseniy on 03.03.2021.
//

import UIKit

struct InternalAlert {
    private var window: UIWindow? {
        return UIApplication.shared.keyWindow ?? UIApplication.shared.windows.first
    }
    
    private let text: String?
    private var isNeedToAnimate = false
    
    init(text: String?) {
        self.text = text
    }
    
    func animated() -> InternalAlert {
        var new = self
        new.isNeedToAnimate = true
        return new
    }
    
    func notAnimated() -> InternalAlert {
        var new = self
        new.isNeedToAnimate = false
        return new
    }
    
    @discardableResult
    func show() -> InternalAlert {
        guard let window = self.window, !(window.subviews.contains { $0 is InternalAlertView }) else {
            return self
        }
        
        let subview = InternalAlertView.fromNib()
        subview.setup(with: text ?? "")
        window.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.topAnchor).isActive = true
        subview.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        subview.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        
        //animations
        if isNeedToAnimate {
            subview.transform = .init(translationX: 0, y: -150)
            
            UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.7, options: .curveEaseIn) {
                subview.transform = .identity
            } 

        }
        return self
    }
    
    @discardableResult
    func hide() -> InternalAlert {
        guard let internalView = window?.subviews.first(where: { $0 is InternalAlertView }) as? InternalAlertView  else {
            return self
        }
        
        if isNeedToAnimate {
            UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.7, options: .curveEaseIn) {
                internalView.transform = .init(translationX: 0, y: -150)
            } completion: { (_) in
                internalView.removeFromSuperview()
            }
        } else {
            internalView.removeFromSuperview()
        }
        
        return self
    }
}
