//
//  UserCanvas.swift
//  UltrasoundPatternDesgner
//
//  Created by YUAN-TSUNG LIOU on 2021/10/27.
//

import SwiftUI

struct UserCanvas: View {
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                path.move(to: CGPoint(x: width * 0.20, y: height * 0.30))
                path.addLine(to: CGPoint(x: width * 0.300, y: height * 0.50))
                path.addLine(to: CGPoint(x: width * 0.400, y: height * 0.90))
                path.addLine(to: CGPoint(x: width * 0.600, y: height * 0.300))
                path.addLine(to: CGPoint(x: width * 0.20, y: height * 0.30))
            }
            .stroke(Color.blue, lineWidth: 20)
            .rotationEffect(.degrees(30))
        }
    }
}

struct UserCanvas_Previews: PreviewProvider {
    static var previews: some View {
        UserCanvas()
    }
}
