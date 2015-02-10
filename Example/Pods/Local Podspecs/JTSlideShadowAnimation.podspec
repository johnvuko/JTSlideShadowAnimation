Pod::Spec.new do |s|
  s.name         = "JTSlideShadowAnimation"
  s.version      = "1.0.0"
  s.summary      = ""
  s.homepage     = "https://github.com/jonathantribouharet/JTSlideShadowAnimation"
  s.license      = { :type => 'MIT' }
  s.author       = { "Jonathan Tribouharet" => "jonathan.tribouharet@gmail.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/jonathantribouharet/JTSlideShadowAnimation.git", :tag => s.version.to_s }
  s.source_files  = 'JTSlideShadowAnimation/*'
  s.requires_arc = true
end
