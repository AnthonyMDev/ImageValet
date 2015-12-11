import UIKit
import XCTest
import Nimble

import Alamofire
import AlamofireImage

import ImageValet

class ImageValetTests: XCTestCase {
  
  var sut: ImageValet!
  var image: UIImage!

  override func setUp() {
    super.setUp()
    
    image = UIImage()
  }
  

}

/*
*  MARK: - In Memory
*/
class InMemoryImageValetTests: ImageValetTests {
  
  override func setUp() {
    super.setUp()
    
    sut = ImageValet(source:.InMemory(image: image))
  }
  
  func test__deliverToImageView__setsImageViewImage() {
    // given
    let imageView = UIImageView()
    
    // when
    sut.deliverToImageView(imageView)
    
    // then
    expect(imageView.image).to(beIdenticalTo(image))
  }
  
  func test__deliverToImageView__callsDidDeliverImage() {
    // given
    let imageView = UIImageView()
    
    var imageDelivered: UIImage?
    var imageViewDeliveredTo: UIImageView?
    
    sut.didDeliverImage = { (image, imageView) -> Void in
      imageDelivered = image
      imageViewDeliveredTo = imageView
    }
    
    // when
    sut.deliverToImageView(imageView)
    
    // then
    expect(imageDelivered).to(beIdenticalTo(image))
    expect(imageViewDeliveredTo).to(beIdenticalTo(imageView))
  }
  
  func test__image__returnsSourceImage() {
    expect(self.sut.image).to(beIdenticalTo(image))
  }
  
}

/*
*  MARK: - URL
*/
class URLImageValetTests: ImageValetTests {
  
  let URL = NSURL(string: "http://www.example.com")!
  
  override func setUp() {
    super.setUp()
    
    sut = ImageValet(source:.URL(URL, placeholder: nil))
  }
  
}

/*
*  MARK: - URL Request
*/
class URLRequestImageValetTests: ImageValetTests {
  
  let request = NSURLRequest(URL: NSURL(string: "http://www.example.com")!)
  
  override func setUp() {
    super.setUp()
    
    sut = ImageValet(source:.URLRequest(request, placeholder: nil))
  }
  
}