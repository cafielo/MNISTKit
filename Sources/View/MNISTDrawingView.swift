//
//  DrawingView.swift
//  MNISTKit
//
//  Created by Joon on 07/11/2017.
//  Copyright © 2017 MNISTKit. All rights reserved.
//

import UIKit

public class MNISTDrawingView: UIImageView {
    
    var isFingerTouched = false
    var fingerPoint: CGPoint?
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        
        self.image?.draw(in: self.bounds)
        let context = UIGraphicsGetCurrentContext()
        context?.move(to: fromPoint)
        context?.addLine(to: toPoint)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(20)
        context?.setStrokeColor(UIColor.white.cgColor)
        context?.setBlendMode(CGBlendMode.normal)
        context?.strokePath()
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
}

// MARK: Public method
extension MNISTDrawingView {
    public func clear() {
        self.image = nil
    }
}


// MARK: Touch Delegate
extension MNISTDrawingView {
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        isFingerTouched = false
        fingerPoint = touches.first?.location(in: self)
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        isFingerTouched = true
        
        let currentPoint = touches.first?.location(in: self)
        drawLine(from: fingerPoint!, to: currentPoint!)
        fingerPoint = currentPoint
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        isFingerTouched = false
    }
}




