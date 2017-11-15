![256_mnistkit](https://user-images.githubusercontent.com/5119286/32812801-3867b03a-c9ea-11e7-831e-37c50fbc07ce.png)

# MNISTKit
MNISTKit makes it easy to deal with MNIST model.

**MNISTKit** is a library for digit detection with coreml model. The rise of A.I. is grounded in the success of deep learning. The “hello world” for deep learning is the MNIST model for handwritten digit recognition. 


[![Carthage compatible](https://img.shields.io/badge/Carthage-Compatible-brightgreen.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/MNISTKit.svg?style=flat)](http://cocoapods.org/pods/MNISTKit)
[![License](https://img.shields.io/cocoapods/l/MNISTKit.svg?style=flat)](https://github.com/cafielo/MNISTKit/blob/master/LICENSE?raw=true)
![Xcode 9.0+](https://img.shields.io/badge/Xcode-9.0%2B-blue.svg)
![iOS 11.0+](https://img.shields.io/badge/iOS-11.0%2B-blue.svg)
![Swift 4.0+](https://img.shields.io/badge/Swift-4.0%2B-orange.svg)

1. [Long way to use CoreML](#long-way-to-use-coreml)
2. [Requirements](#requirements)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Credits](#credits)
6. [License](#license)


## Long way to use CoreML
There are some works to implement MNIST with CoreML Framework
- Build a model
- Convert to mlmodel
- Make a hand writable UIView 
- Convert hand writable view to image and resize it
- Get pixelbuffers from resized image
- Predict the image with mlmodel using pixelbuffer

**MNISTKit** makes it easy to deal with MNIST model.

## Requirements
- iOS 11.0+ 
- Xcode 9.0+
- Swift 4.0+


## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate MNISTKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'MNISTKit'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Windless into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "cafielo/MNISTKit"
```

Run `carthage update` to build the framework and drag the built `MNISTKit.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate MNISTKit into your project manually.

---


## Usage


1. Drag a UIView the desired size of your player onto your Storyboard.
2. Change the UIView's class in the Identity Inspector tab to `MNISTDrawingView`.
3. Import `MNISTKit` in your ViewController.
4. Add the following property to your ViewController.
```swift
    @IBOutlet weak var drawingView: MNISTDrawingView!
```
5. Creat a `MNISTModelController` to predict later.
```swift
let mnistModelController = MNISTModelController()
```
6. Detect hand written digit using `MNISTModelController` and `MNISTDrawingView`.
```swift 
@IBAction func predict(_ sender: UIButton) {
        
        guard let image = drawingView.image else {
            return
        }
        
        guard let predictedNum = mnistModelController.predictNum(image: image) else {
            return
        }
        
        numLabel.text = "\(predictedNum) is predicted"
    }
```

### Example

![mnist](https://user-images.githubusercontent.com/5119286/32814584-3f3b717c-c9f3-11e7-8dd2-d5831c693473.gif)

Following code is a simple example 
```swift 
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
```



## Credits

- Joonwon Lee ([@joonwonlee](https://github.com/cafielo))


## License
MNISTKit is released under the MIT license. See LICENSE for details.



