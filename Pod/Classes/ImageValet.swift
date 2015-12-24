//
//  ImageValet.swift
//  ImageValet
//
//  Created by Anthony Miller on 12/10/15.
//

import Foundation

import Alamofire
import AlamofireImage

/// `ImageValet` provides delivery of an image from a local or remote source to a `UIImageView`.
public class ImageValet: Equatable {
  
  /**
   The source of an image for an `ImageValet`.
   
   - InMemory:    The image is stored in memory as a `UIImage`.
      - image:        The `UIImage` stored in memory.
   
   - URL:         The image is stored remotely or locally and can be access with an `NSURL`.
      - URL:          The `NSURL` to access the image.
      - placeholder:  An optional `UIImage` to use a placeholder while the image from the `URL` is retrieved.
   
   - URLRequest:  The image is stored remotely or locally and can be access with an `NSURLRequest`.
      - request:      The `NSURLRequest` to access the image.
      - placeholder:  An optional `UIImage` to use a placeholder while the image from the `request` is retrieved.
   */
  public enum ImageSource: Equatable {
    
    case InMemory(image: UIImage),
    URL(NSURL, placeholder: UIImage?),
    URLRequest(NSURLRequest, placeholder: UIImage?)
    
  }
  
  /// The source of the image that the valet will manage.
  public let source: ImageSource
  
  /// The image that the valet manages. If the image has not been retrieved yet, this will be `nil`.
  public private(set) var image: UIImage?
  
  /// A closure that will be called each time the valet's `image` is set to a `UIImageView`.
  public var didDeliverImage: ((UIImage, toImageView: UIImageView) -> Void)?
  
  /*
  *  MARK: Initialization
  */
  
  /**
  Initializes an `ImageValet` with a given `ImageSource`.
  
  - parameter source: The source used to retrieve the image for the valet.
  
  - returns: An `ImageValet` for the given source.
  */
  public init(source: ImageSource) {
    self.source = source
    
    switch source {
    case .InMemory(let image):
      self.image = image
      
    default: break
    }
  }
  
  /*
  *  MARK: Deliver To Image View
  */
  
  /**
  Delivers (sets) the image for the valet on the given `UIImageView`. If the image must be retrieved, the image is retrieved asychronously and then set to the image view.
  
  - parameter imageView: The image view to deliver the valet's `image` to.
  */
  public func deliverToImageView(imageView: UIImageView) {
    func deliverImage(image: UIImage) {
      imageView.image = image
      didDeliverImage?(image, toImageView: imageView)
    }
    
    if let image = image {
      deliverImage(image)
      return
    }
    
    switch source {
    case .InMemory(let image):
      deliverImage(image)
      
    case .URL(let URL,let placeholder):
      deliverImageToImageView(imageView,
        request: NSURLRequest(URL: URL),
        placeholder: placeholder)
      
    case .URLRequest(let request, let placeholder):
      deliverImageToImageView(imageView,
        request: request,
        placeholder: placeholder)
    }
  }
  
  private func deliverImageToImageView(imageView: UIImageView, request: NSURLRequest, placeholder: UIImage?) {
    imageView.af_setImageWithURLRequest(request,
      placeholderImage: placeholder,
      filter: nil,
      imageTransition: .CrossDissolve(0.2),
      completion: { [weak self] (response) -> Void in
        if let image = response.result.value {
          self?.image = image
          self?.didDeliverImage?(image, toImageView: imageView)
        }
      })
  }
  
}

// MARK: - UIImageView+ImageValet
extension UIImageView {
  
  /**
   Delivers the image from the given `ImageValet` to the image view.
   
   - parameter imageValet: The `ImageValet` to deliver it's `image`.
   */
  func iv_deliverImage(imageValet: ImageValet) {
    imageValet.deliverToImageView(self)
  }
  
}

// MARK: - Equatable

public func ==(lhs: ImageValet, rhs: ImageValet) -> Bool {
  return lhs.source == rhs.source &&
  lhs.image == rhs.image
}

public func ==(lhs: ImageValet.ImageSource, rhs: ImageValet.ImageSource) -> Bool {
  switch (lhs, rhs) {
  case (.InMemory(let lhsImage), .InMemory(let rhsImage)):
    return lhsImage == rhsImage
    
  case (.URL(let lhsURL, let lhsPlaceholder), .URL(let rhsURL, let rhsPlaceholder)):
    return lhsURL == rhsURL
    && lhsPlaceholder == rhsPlaceholder
    
  case (.URLRequest(let lhsRequest, let lhsPlaceholder), .URLRequest(let rhsRequest, let rhsPlaceholder)):
    return lhsRequest == rhsRequest
      && lhsPlaceholder == rhsPlaceholder
    
  default: return false
  }
}