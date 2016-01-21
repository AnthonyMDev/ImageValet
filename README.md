# ImageValet

[![Version](https://img.shields.io/cocoapods/v/ImageValet.svg?style=flat)](http://cocoapods.org/pods/ImageValet)
[![License](https://img.shields.io/cocoapods/l/ImageValet.svg?style=flat)](http://cocoapods.org/pods/ImageValet)
[![Platform](https://img.shields.io/cocoapods/p/ImageValet.svg?style=flat)](http://cocoapods.org/pods/ImageValet)

ImageValet allows you to lazy load a `UIImage` from anywhere! It supports sychronous or asychronous loading of images and provides functionality for using a placeholder image while loading asychronously.

## Usage

An `ImageValet` stores information to lazily load a `UIImage` and can be created from a variety of image sources.

### Sources

Each enum value provides the ability to load an image from a different source.

**`NSURL`**

```
let myImageURL = NSURL(string: "http://www.example.com/myImage.jpg")!
let placeholderImage = UIImage()

let valet = ImageValet(source: .URL(myImageURL, placeholder: placeholderImage)

```

**`NSURLRequest`**

```
let myImageURL = NSURL(string: "http://www.example.com/myImage.jpg")!
let request = NSMutableURLRequest(URL: myImageURL)
request.setValue("password", forHTTPHeaderField: "Authorization")
let placeholderImage = UIImage()

let valet = ImageValet(source: .URLRequest(request, placeholder: placeholderImage)

```

**`Operation`**

```
let placeholderImage = UIImage()

let valet = ImageValet(source: .Operation({ (completion) -> Void in

    // Do something to get your image

    completion(.Success(image))

}, placeholder: placeholderImage))

```

**`InMemory`**

```
let myImage = UIImage()

let valet = ImageValet(source:.InMemory(image: myImage))

```

### Lazy Loading

You can set the image for an `ImageValet` to a `UIImageView` with `deliverToImageView(imageView: UIImageView)`. The placeholder image will be used while the image is downloaded, and the image will be downloaded lazily only once this method is called.

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
