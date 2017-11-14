//
//  ViewController.swift
//  Example
//
//  Created by Joon on 07/11/2017.
//  Copyright © 2017 MNISTKit. All rights reserved.
//

import UIKit
import MNISTKit

class ViewController: UIViewController {
    @IBOutlet weak var drawingView: MNISTDrawingView!
    @IBOutlet weak var numLabel: UILabel!
    let mnistModelController = MNISTModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func predict(_ sender: UIButton) {
        
        guard let image = drawingView.image else {
            return
        }
        
        guard let predictedNum = mnistModelController.predictNum(image: image) else {
            return
        }
        
        numLabel.text = "\(predictedNum) is predicted"
    }
    
    @IBAction func clear(_ sender: UIButton) {
        drawingView.clear()
        numLabel.text = "???"
    }
}

