//
//  CustomView.swift
//  ProjectMips
//
//  Created by Amin Fadul on 4/21/18.
//  Copyright © 2018 ProjectMips. All rights reserved.
//

import UIKit

/// Designable class for view
@IBDesignable class CustomView : UIView {
    
    /// Custom the border width
    @IBInspectable var borderWidth : Int {
        set {
            self.layer.borderWidth = CGFloat(newValue)
        } get {
            return Int(self.layer.borderWidth)
        }
    }
    /// Custom the corner radius
    @IBInspectable var cornerRadius : Int {
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        } get {
            return Int(self.layer.cornerRadius)
        }
    }
    
    /// Custom the color of the border
    @IBInspectable var borderColor : UIColor = UIColor.white {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var label_Rotation: Double = 0 {
        didSet {
            rotateLabel(labelRotation: label_Rotation)
            self.layoutIfNeeded()
        }
    }
    
    func rotateLabel(labelRotation: Double)  {
        self.transform = CGAffineTransform(rotationAngle: CGFloat((Double.pi * 2) + labelRotation))
    }
    
}
