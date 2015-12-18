Pod::Spec.new do |s|
  s.name             = "ImageValet"
  s.version          = "1.1.0"
  s.summary          = "Delivers an image from a variety of local and remote image sources to a `UIImageView` using AlamofireImage for asynchronous requests."

  s.homepage         = "https://github.com/AnthonyMDev/ImageValet"
  s.license          = 'MIT'
  s.author           = { "Anthony Miller" => "AnthonyMDev@gmail.com" }
  s.source           = { :git => "https://github.com/AnthonyMDev/ImageValet.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AnthonyMDev'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.frameworks = 'UIKit'
  s.dependency 'Alamofire', '~> 3.1'
  s.dependency 'AlamofireImage', '~> 2.1'
end
