Pod::Spec.new do |s|
  s.name         = 'Navigation-stack'
  s.version      = '0.0.1'
  s.summary      = 'Show list of navigationControllers'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/Ramotion/navigation-stack'
  s.author       = { 'Juri Vasylenko' => 'juri.v@ramotion.com' }
  s.source       = { :git => 'https://github.com/Ramotion/navigation-stack', :tag => s.version.to_s }
  s.source_files  = 'https://github.com/Ramotion/navigation-stack/tree/master/Source/**/*.{h,m,swift}'
  s.requires_arc = true
end
