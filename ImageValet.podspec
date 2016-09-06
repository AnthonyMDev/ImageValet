Pod::Spec.new do |s|
  s.name             = "ImageValet"
  s.version          = "2.1.1"
  s.summary          = "Delivers an image from a local or remote source to a `UIImageView` or  closure, using `AlamofireImage` for asynchronous requests."

  s.homepage         = "https://github.com/AnthonyMDev/ImageValet"
  s.license          = 'MIT'
  s.author           = { "Anthony Miller" => "AnthonyMDev@gmail.com" }
  s.source           = { :git => "https://github.com/AnthonyMDev/ImageValet.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AnthonyMDev'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Source/**/*'

  s.frameworks = 'UIKit'
  s.dependency 'Alamofire'
  s.dependency 'AlamofireImage'
end
