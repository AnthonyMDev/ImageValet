# ImageValet

[![Version](https://img.shields.io/cocoapods/v/ImageValet.svg?style=flat)](http://cocoapods.org/pods/ImageValet)
[![License](https://img.shields.io/cocoapods/l/ImageValet.svg?style=flat)](http://cocoapods.org/pods/ImageValet)
[![Platform](https://img.shields.io/cocoapods/p/ImageValet.svg?style=flat)](http://cocoapods.org/pods/ImageValet)

## Usage

```
let myImageURL = NSURL(string: "http://www.example.com/myImage.jpg")!
let placeholderImage = UIImage()

let valet = ImageValet(source: .URL(myImageURL, placeholder: placeholderImage)

valet.didDeliverImage = { (image, imageView) -> Void in 
  // Do something when an image is delivered
}

let UIImageView = UIImageView()

valet.deliverToImageView(imageView)
// or
imageView.iv_deliverImage(valet)

```

## Requirements

## Installation

ImageValet is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ImageValet"
```

## Author

Anthony Miller, AnthonyMDev@gmail.com

## License

ImageValet is available under the MIT license. See the LICENSE file for more info.
