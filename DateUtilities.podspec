Pod::Spec.new do |s|
  s.name             = "DateUtilities"
  s.version          = "1.0.2"
  s.summary          = "Simple swift Date extensions"

  s.description      = <<-DESC
Date extensions: TimeInterval addition, date comparison
                       DESC

  s.license          = { :type => "MIT" }
  s.homepage         = "https://github.com/chipp/DateUtilities"
  s.author           = {
    "Vladimir Burdukov" => "chippcheg@gmail.com"
  }
  s.source           = { :git => "https://github.com/chipp/DateUtilities.git", :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '3.0'
  s.source_files = 'Sources/*.swift'

end
