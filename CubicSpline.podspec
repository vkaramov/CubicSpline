#
# Be sure to run `pod lib lint CubicSpline.podspec' to ensure this is a


Pod::Spec.new do |s|
  s.name             = 'CubicSpline'
  s.version          = '0.1.1'
  s.summary          = 'Cubic Spline in Swift'

  s.description      = <<-DESC
A simple cubic spline (https://en.wikipedia.org/wiki/Cubic_Hermite_spline) library written in Swift
                       DESC

  s.homepage         = 'https://github.com/vkaramov/CubicSpline'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vkaramov' => 'vkaramov a_t yandex d|o|t ru' }
  s.source           = { :git => 'https://github.com/vkaramov/CubicSpline.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target  = '10.10'

  s.source_files = 'CubicSpline/Classes/**/*'
  
   s.frameworks = 'Foundation'
end
