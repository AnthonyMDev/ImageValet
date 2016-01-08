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
  
  func test__deliver__callsCompletion() {
    // given
    var imageDelivered: UIImage?
    
    // when
    sut.deliver { result in
      imageDelivered = result.value
    }
    
    // then
    expect(imageDelivered).to(beIdenticalTo(image))
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