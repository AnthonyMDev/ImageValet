Pod::Spec.new do |s|
  s.name             = "ImageValet"
  s.version          = "2.2.4"
  s.summary          = "Delivers an image from a local or remote source to a `UIImageView` or  closure, using `AlamofireImage` for asynchronous requests."

  s.homepage         = "https://github.com/AnthonyMDev/ImageValet"
  s.license          = 'MIT'
  s.author           = { "Anthony Miller" => "AnthonyMDev@gmail.com" }
  s.source           = { :git => "https://github.com/AnthonyMDev/ImageValet.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/AnthonyMDev'

  s.requires_arc = true

  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '10.1'

  s.source_files = 'Pod/Source/**/*'

  s.frameworks = 'UIKit'
  s.dependency 'Alamofire', '~> 4.5'
  s.dependency 'AlamofireImage', '~> 3.3'
end
