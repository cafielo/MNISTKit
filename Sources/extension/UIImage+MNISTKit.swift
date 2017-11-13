//
//  UIImage+MNISTKit.swift
//  MNISTKit-iOS
//
//  Created by Joon on 08/11/2017.
//  Copyright © 2017 MNISTKit. All rights reserved.
//

import UIKit

extension UIImage {
    func resize(to size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, true, 1)
        let rect = CGRect(origin: CGPoint.zero, size: size)
        self.draw(in: rect)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        return resizedImage!
    }
    
    func buffer() -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer?
        let width = Int(self.size.width)
        let height = Int(self.size.height)
        
        let status = CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_OneComponent8, nil, &pixelBuffer)
        guard let pxBuffer = pixelBuffer, status == kCVReturnSuccess else {
            return nil
        }
        CVPixelBufferLockBaseAddress(pxBuffer, CVPixelBufferLockFlags(rawValue:0))
        let pixelData = CVPixelBufferGetBaseAddress(pxBuffer)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        
        let bytesPerRow = CVPixelBufferGetBytesPerRow(pxBuffer)
        let bitmapContext = CGContext(data: pixelData, width: width, height: height, bitsPerComponent: 8, bytesPerRow:bytesPerRow, space: colorSpace, bitmapInfo: CGImageAlphaInfo.none.rawValue)!
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        bitmapContext.draw(self.cgImage!, in: rect)
        
        return pxBuffer
    }
}

