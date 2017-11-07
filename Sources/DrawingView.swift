//
//  DrawingView.swift
//  MNISTKit
//
//  Created by Joon on 07/11/2017.
//  Copyright © 2017 MNISTKit. All rights reserved.
//

import UIKit

public class DrawingView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//// MARK: Touch Delegate
//extension CalcViewController {
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        isFingerTouched = false
//        fingerPoint = touches.first?.location(in: drawingImageView)
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesMoved(touches, with: event)
//        isFingerTouched = true
//
//        let currentPoint = touches.first?.location(in: drawingImageView)
//        drawLine(from: fingerPoint!, to: currentPoint!)
//        fingerPoint = currentPoint
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesEnded(touches, with: event)
//        isFingerTouched = false
//
//        guard let handWrittenImage = drawingImageView.image, let predictedNum = mnistModel.predictNum(image: handWrittenImage) else {
//            return
//        }
//
//        let arr = [0, 1, 2, 3]
//
//        if arr.contains(predictedNum) {
//            if let handWrittenImage = drawingImageView.image, let num = mnistModel.predictNum(image: handWrittenImage) {
//                calculator.updateValue(newNum: num)
//            } else {
//                // nope
//            }
//            updateLabel()
//            drawingViewClear()
//            isPreviousWritingEnded = true
//        } else {
//            if isPreviousWritingEnded {
//                startProcessingAnimation()
//                startTimer()
//                isPreviousWritingEnded = false
//            } else {
//                // nope
//            }
//        }
//    }
//}
//
//
