//
//  CircleClosing.swift
//  ProjectMips
//
//  Created by Amin Fadul on 4/30/18.
//  Copyright © 2018 ProjectMips. All rights reserved.
//
import UIKit
import GLKit

class CircleClosing: UIView {
    
    // MARK: Properties
    let centerX:CGFloat = 55
    let centerY:CGFloat = 55
    let radius:CGFloat = 50
    
    var currentAngle:Float = -90
    
    let timeBetweenDraw:CFTimeInterval = 0.01
    
    // MARK: Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        self.backgroundColor = UIColor.clear
        Timer.scheduledTimer(timeInterval: timeBetweenDraw, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // MARK: Drawing
    @objc func updateTimer() {
        
        if currentAngle < 270 {
            currentAngle += 1
            setNeedsDisplay()
        } else {
            self.removeFromSuperview()
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let path = CGMutablePath()
    
        path.addArc(center: CGPoint(x:centerX, y:centerY),
                    radius: radius,
                    startAngle: -(CGFloat.pi / 2),
                    endAngle: CGFloat(GLKMathDegreesToRadians(currentAngle)),
                    clockwise: false)
        
        context!.addPath(path)
        context!.setStrokeColor(UIColor.red.cgColor)
        context!.setLineWidth(3)
        context!.strokePath()
    }
}
