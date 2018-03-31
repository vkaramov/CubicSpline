//
//  ViewController.swift
//  CubicSpline
//
//  Created by Viacheslav Karamov on 31.03.2018.
//  Copyright (c) 2018 Viacheslav Karamov. All rights reserved.
//

import UIKit
import CubicSpline

class ViewController: UIViewController {

    @IBOutlet private weak var splineView: SplineView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let spline = CubicSpline(xPoints:[0.0, 0.1, 0.2, 0.4, 0.6, 0.8, 0.9, 1.0], yPoints:[0.5, 0.5, 0.7, 0.3, 0.6, 0.4, 0.5, 0.5])
        splineView.spline = spline
    }
}

