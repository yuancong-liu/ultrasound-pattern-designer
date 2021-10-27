//
//  UserShapes.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/27.
//

import Foundation

struct UserShape {
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    static let adjustment: CGFloat = 0.0085
    
    static let segments = [
        Segment(
                    line:    CGPoint(x: 0.60, y: 0.05),
                    curve:   CGPoint(x: 0.40, y: 0.05),
                    control: CGPoint(x: 0.50, y: 0.00)
                ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        )
    ]
}
