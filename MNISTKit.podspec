Pod::Spec.new do |s|
  s.name         = "MNISTKit"
  s.version      = "1.0.0"
  s.summary      = "Coolest MNISTKit Ever"
  s.description  = "Start CoreML with MNISTKit"
  s.homepage     = "https://github.com/cafielo/MNISTKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "joonwon lee" => "cafielo@gmail.com" }  
  s.ios.deployment_target = "11.0"
  s.source       = { :git => "https://github.com/cafielo/MNISTKit.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
