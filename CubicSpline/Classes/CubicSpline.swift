//
//  CubicSpline.swift
//  CubicSpline
//
//  Based on SAMCubicSpline library by Sam Soffes
//
//  Created by Viacheslav Karamov on 30.03.2018.
//  Copyright © 2018 Viacheslav Karamov. All rights reserved.
//

import Foundation

open class CubicSpline {
    fileprivate var x: Array<Double>
    fileprivate var a: Array<Double>
    fileprivate var b: Array<Double>
    fileprivate var c: Array<Double>
    fileprivate var d: Array<Double>

    public init(xPoints x: Array<Double>, yPoints a: Array<Double>) {

        self.x = x
        self.a = a

        let count: Int = x.count

        assert(x.count == a.count, "Number of X points should be the same as Y points")

        self.b = Array<Double>(repeating: 0.0, count: count)
        self.c = Array<Double>(repeating: 0.0, count: count)
        self.d = Array<Double>(repeating: 0.0, count: count)

        guard count > 0 else { return }

        let n: Int = count - 1
        var h = Array<Double>(repeating: 0.0, count: count)
        var y = Array<Double>(repeating: 0.0, count: count)
        var l = Array<Double>(repeating: 0.0, count: count)
        var u = Array<Double>(repeating: 0.0, count: count)
        var z = Array<Double>(repeating: 0.0, count: count)
        var k = Array<Double>(repeating: 0.0, count: count)
        var s = Array<Double>(repeating: 0.0, count: count)

        for i in 0..<n {
            h[i] = x[i + 1] - x[i]
            k[i] = a[i + 1] - a[i]
            s[i] = k[i] / h[i]
        }

        for i in 1..<n {
            y[i] = 3 / h[i] * (a[i + 1] - a[i]) - 3 / h[i - 1] * (a[i] - a[i - 1])
        }

        l[0] = 1
        u[0] = 0
        z[0] = 0

        for i in 1..<n {
            l[i] = 2 * (x[i + 1] - x[i - 1]) - h[i - 1] * u[i - 1]
            u[i] = h[i] / l[i]
            z[i] = (y[i] - h[i - 1] * z[i - 1]) / l[i]
        }

        l[n] = 1
        z[n] = 0

        var i = n - 1
        while i >= 0 {
            c[i] = z[i] - u[i] * c[i + 1]
            b[i] = (a[i + 1] - a[i]) / h[i] - h[i] * (c[i + 1] + 2.0 * c[i]) / 3.0
            d[i] = (c[i + 1] - c[i]) / (3 * h[i])
            i -= 1
        }

        c[n] = 0
    }

    public func interpolate(_ input: Double) -> Double {
        // No points. Return identity.
        guard x.count > 0 else { return input }

        var i: Int = x.count - 1

        while i > 0 {
            if x[i] <= input {
                break
            }
            i -= 1
        }

        let deltaX: Double = input - x[i]
        let af: Double = b[i]
        let cf: Double = c[i]
        let df: Double = d[i]
        return a[i] + af * deltaX + cf * pow(deltaX, 2) + df * pow(deltaX, 3)
    }
}
