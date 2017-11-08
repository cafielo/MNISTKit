//
//  MNISTModelController.swift
//  mnistCalculator
//
//  Created by Joon on 29/10/2017.
//  Copyright © 2017 naver. All rights reserved.
//

import UIKit
import CoreML

enum OneHot: Int {
    case negative
    case positive
}

public class MNISTModelController {
    
    let imageSizeForInfering = CGSize(width: 28, height: 28)
    let model = MNISTCNNModel()
    
    public init() { }
    
    public func predictNum(image: UIImage) -> Int? {
        
        let resizedImage = image.resize(to: imageSizeForInfering)
        guard let pixelBuffer = resizedImage.buffer() else {
            return nil
        }
        
        guard let result = try? model.prediction(image: pixelBuffer) else {
            return nil
        }
        
        var predictedNum: Int? = nil

        for i in 0..<10 {
            let predictedValue = OneHot(rawValue: Int.init(truncating: result.output1[i]))
            if predictedValue == .positive {
                predictedNum = i
            } else {
                // nope
            }
        }
        return predictedNum
    }
}
