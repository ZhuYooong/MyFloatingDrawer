//
//  ZYDrawerView.swift
//  a
//
//  Created by MAC on 2017/2/14.
//  Copyright © 2017年 TongBuWeiYe. All rights reserved.
//

import UIKit

class ZYDrawerView: UIView {
    let kZYCenterViewContainerCornerRadius: CGFloat = 5.0
    let kZYDefaultViewContainerWidth: CGFloat = 280.0
    // MARK: Initialization
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(backgroundImageView)
        self.addSubview(centerViewContainer)
        self.addSubview(leftViewContainer)
        self.addSubview(rightViewContainer)
        
        self.addConstraints(backgroundViewConstraints)
        self.addConstraints(centerViewConstraints)
        self.addConstraints(leftViewConstraints)
        self.addConstraints(rightViewConstraints)
    }
    override public func willMove(toSuperview newSuperview: UIView?) {
        self.bringSubview(toFront: self.centerViewContainer)
    }
    override public func layoutSubviews() {
        updateShadowPath()
    }
    // MARK: Background Image
    private var _backgroundImageView: UIImageView?
    var backgroundImageView: UIImageView {
        get {
            if let imageView = _backgroundImageView {
                return imageView
            }
            let imageView = UIImageView(frame: self.frame)
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            _backgroundImageView = imageView
            return imageView
        }
    }
    private var _backgroundViewConstraints: [NSLayoutConstraint]?
    private var backgroundViewConstraints: [NSLayoutConstraint] {
        get {
            if let constraints = _backgroundViewConstraints {
                return constraints
            }
            let constraints = [
                NSLayoutConstraint(item: self.backgroundImageView, attribute: .leading,  relatedBy: .equal, toItem: self, attribute: .leading,  multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: self.backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: self.backgroundImageView, attribute: .top,      relatedBy: .equal, toItem: self, attribute: .top,      multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: self.backgroundImageView, attribute: .bottom,   relatedBy: .equal, toItem: self, attribute: .bottom,   multiplier: 1.0, constant: 0.0)
            ]
            _backgroundViewConstraints = constraints
            return constraints
        }
    }
    // MARK: Left view container
    private var _leftViewContainer: UIView?
    var leftViewContainer: UIView {
        get {
            if let container = _leftViewContainer {
                return container
            }
            let container = UIView(frame: self.frame)
            container.translatesAutoresizingMaskIntoConstraints = false
            _leftViewContainer = container
            return container
        }
    }
    private var _leftViewConstraints: [NSLayoutConstraint]?
    private var leftViewConstraints: [NSLayoutConstraint] {
        if let constraints = _leftViewConstraints {
            return constraints
        }
        let constraints = [
            NSLayoutConstraint(item: self.leftViewContainer, attribute: .height,   relatedBy: .equal, toItem: self, attribute: .height,  multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.leftViewContainer, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.leftViewContainer, attribute: .top,      relatedBy: .equal, toItem: self, attribute: .top,     multiplier: 1.0, constant: 0.0),
            self.leftViewWidthConstraint
        ]
        _leftViewConstraints = constraints
        return constraints
    }
    private var _leftViewWidthConstraint: NSLayoutConstraint?
    private var leftViewWidthConstraint: NSLayoutConstraint {
        get {
            if let retVal = _leftViewWidthConstraint {
                return retVal
            }
            let retVal = NSLayoutConstraint(item: self.leftViewContainer, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,  multiplier: 1.0, constant: self.kZYDefaultViewContainerWidth)
            _leftViewWidthConstraint = retVal
            return retVal
        }
    }
    // MARK: Right view container
    private var _rightViewContainer: UIView?
    var rightViewContainer: UIView {
        get {
            if let retVal = _rightViewContainer {
                return retVal
            }
            let retVal = UIView(frame: self.frame)
            retVal.translatesAutoresizingMaskIntoConstraints = false
            _rightViewContainer = retVal
            return retVal
        }
    }
    private var _rightViewConstraints: [NSLayoutConstraint]?
    private var rightViewConstraints: [NSLayoutConstraint] {
        get {
            if let constraints = _rightViewConstraints {
                return constraints
            }
            let constraints = [
                NSLayoutConstraint(item: self.rightViewContainer, attribute: .height,  relatedBy: .equal, toItem: self, attribute: .height,   multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: self.rightViewContainer, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: self.rightViewContainer, attribute: .top,     relatedBy: .equal, toItem: self, attribute: .top,      multiplier: 1.0, constant: 0.0),
                self.rightViewWidthConstraint
            ]
            _rightViewConstraints = constraints
            return constraints
        }
    }
    private var _rightViewWidthConstraint: NSLayoutConstraint?
    private var rightViewWidthConstraint: NSLayoutConstraint {
        get {
            if let constraint = _rightViewWidthConstraint {
                return constraint
            }
            let constraint = NSLayoutConstraint(item: self.rightViewContainer, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,  multiplier: 1.0, constant: self.kZYDefaultViewContainerWidth)
            _rightViewWidthConstraint = constraint
            return constraint
        }
    }
    // MARK: Center view container
    private var _centerViewContainer: UIView?
    var centerViewContainer: UIView {
        get {
            if let container = _centerViewContainer {
                return container
            }
            let container = UIView(frame: self.frame)
            container.translatesAutoresizingMaskIntoConstraints = false
            _centerViewContainer = container
            return container
        }
    }
    private var _centerViewConstraints: [NSLayoutConstraint]?
    private var centerViewConstraints: [NSLayoutConstraint] {
        if let constraints = _centerViewConstraints {
            return constraints
        }
        let constraints = [
            NSLayoutConstraint(item: self.centerViewContainer, attribute: .leading,  relatedBy: .equal, toItem: self, attribute: .leading,  multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.centerViewContainer, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.centerViewContainer, attribute: .top,      relatedBy: .equal, toItem: self, attribute: .top,      multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: self.centerViewContainer, attribute: .bottom,   relatedBy: .equal, toItem: self, attribute: .bottom,   multiplier: 1.0, constant: 0.0)
        ]
        _centerViewConstraints = constraints
        return constraints
    }
    // MARK: Reveal Widths
    var leftViewContainerWidth: CGFloat {
        get {
            return self.leftViewWidthConstraint.constant
        }
        set {
            self.leftViewWidthConstraint.constant = newValue
        }
    }
    var rightViewContainerWidth: CGFloat {
        get {
            return self.rightViewWidthConstraint.constant
        }
        set {
            self.rightViewWidthConstraint.constant = newValue
        }
    }
    private var _shouldRadiusCenterViewController: Bool = false
    var shouldRadiusCenterViewController: Bool {
        get {
            return _shouldRadiusCenterViewController
        }
        set {
            if let view = self.centerViewContainer.subviews.first {
                if (newValue) {
                    view.layer.borderColor   = UIColor(white: 1.0, alpha: 0.15).cgColor
                    view.layer.borderWidth   = 1.0
                    view.layer.masksToBounds = true
                    view.layer.cornerRadius  = kZYCenterViewContainerCornerRadius
                } else {
                    view.layer.borderColor   = UIColor.clear.cgColor
                    view.layer.borderWidth   = 0.0
                    view.layer.masksToBounds = false
                    view.layer.cornerRadius  = 0.0
                }
            }
            _shouldRadiusCenterViewController = newValue
        }
    }
    private var _shouldShadowCenterViewContainer: Bool?
    var shouldShadowCenterViewContainer: Bool {
        get {
            if let retVal = _shouldShadowCenterViewContainer {
                return retVal
            }
            _shouldShadowCenterViewContainer = false
            return false
        }
        set {
            let layer = self.centerViewContainer.layer
            if (newValue) {
                layer.shadowRadius  = 20.0
                layer.shadowColor   = UIColor.black.cgColor
                layer.shadowOpacity = 0.4
                layer.shadowOffset  = CGSize(width: 0.0, height: 0.0)
                layer.masksToBounds = false
                
                self.updateShadowPath()
                
            } else {
                layer.shadowRadius  = 0.0
                layer.shadowColor   = UIColor.clear.cgColor
                layer.shadowOpacity = 0.0
                layer.shadowOffset  = CGSize(width: 0.0, height: 0.0)
                layer.masksToBounds = true
            }
            _shouldShadowCenterViewContainer = newValue
        }
    }
    // MARK: Helpers
    func updateShadowPath() {
        let layer = self.centerViewContainer.layer
        let increase = layer.shadowRadius
        var rect = self.centerViewContainer.bounds
        
        rect.origin.x -= increase
        rect.origin.y -= increase
        rect.size.width += increase * 2.0
        rect.size.height += increase * 2.0
        
        layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: kZYCenterViewContainerCornerRadius).cgPath
    }
    func viewContainerForDrawerSide(drawerSide: ZYDrawerSide) -> UIView? {
        var viewContainer: UIView?
        switch drawerSide {
        case .Left:
            viewContainer = self.leftViewContainer
        case .Right:
            viewContainer = self.rightViewContainer
        case .None:
            viewContainer = nil
        }
        return viewContainer
    }
    // MARK: Event Handling
    func willOpenDrawer(viewController: ZYDrawerViewController) {
        self.shouldRadiusCenterViewController = true
        self.shouldShadowCenterViewContainer = true
    }
    func willCloseDrawer(viewController: ZYDrawerViewController) {
        self.shouldRadiusCenterViewController = false
        self.shouldShadowCenterViewContainer = false
    }
}
