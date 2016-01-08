# ImageValet

[![Version](https://img.shields.io/cocoapods/v/ImageValet.svg?style=flat)](http://cocoapods.org/pods/ImageValet)
[![License](https://img.shields.io/cocoapods/l/ImageValet.svg?style=flat)](http://cocoapods.org/pods/ImageValet)
[![Platform](https://img.shields.io/cocoapods/p/ImageValet.svg?style=flat)](http://cocoapods.org/pods/ImageValet)

## Usage

```
let myImageURL = NSURL(string: "http://www.example.com/myImage.jpg")!
let placeholderImage = UIImage()

let valet = ImageValet(source: .URL(myImageURL, placeholder: placeholderImage)

let UIImageView = UIImageView()

valet.deliverToImageView(imageView)
// or
imageView.iv_deliverImage(valet)

```

`ImageValet` can also deliver an image asynchronously using a closure. 

```
let valet = ImageValet(source: .URL(myImageURL, placeholder: placeholderImage)

valet.deliver { result in
  // Do something when the image is delivered
}
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
