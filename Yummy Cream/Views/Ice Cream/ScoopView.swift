//
//  ScoopView.swift
//  Yummy Cream
//
//  Created by M78 on 9/16/18.
//  Copyright © 2018 M78. All rights reserved.
//

import UIKit

@IBDesignable
class ScoopView: UIView {
    
    // MARK: - Instance Properties
    @IBInspectable var topColor: UIColor = Flavor.chocolate.topColor {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable var bottomColor: UIColor = Flavor.chocolate.bottomColor {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - View Lifecycle
    override func draw(_ rect: CGRect) {
        
        // All is copied from the original one.
        let context = UIGraphicsGetCurrentContext()!
        
        let path = CGPath(ellipseIn: bounds, transform: nil)
        context.addPath(path)
        context.clip()
        
        let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                  colors: [topColor.cgColor, bottomColor.cgColor] as CFArray,
                                  locations: [0, 1])!
        let startPoint = CGPoint(x: bounds.midX, y: bounds.minY)
        let endPoint = CGPoint(x: bounds.midX, y: bounds.maxY)
        
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions())
    }
    
        
}
