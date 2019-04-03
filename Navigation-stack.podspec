Pod::Spec.new do |s|
  s.name         = 'Navigation-stack'
  s.version      = '3.1.0'
  s.summary      = 'Show list of navigationControllers'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/Ramotion/navigation-stack'
  s.author       = { 'Juri Vasylenko' => 'juri.v@ramotion.com' }
  s.ios.deployment_target = '10.0'
  s.source       = { :git => 'https://github.com/Ramotion/navigation-stack.git', :tag => s.version.to_s }
  s.source_files  = 'Source/**/*.swift'
end
