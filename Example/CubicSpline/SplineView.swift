//
//  SplineView.swift
//  CubicSpline_Example
//
//  Created by Viacheslav Karamov on 31.03.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import CubicSpline

class SplineView: UIView {

    var spline: CubicSpline? {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let spline = spline else { return }
        let currentColor: UIColor = .black
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0);
        context?.setStrokeColor(currentColor.cgColor);

        let graphSize = self.bounds.size
        for x in 0 ..< Int(graphSize.height) {
            let y: Double = spline.interpolate(Double(x) / Double(graphSize.height)) * Double(graphSize.width)
            if x == 0 {
                context?.move(to: CGPoint(x: Double(x), y: y))
            }
            else {
                context?.addLine(to: CGPoint(x: Double(x), y: y))
            }
        }
        context?.strokePath()
    }
}
