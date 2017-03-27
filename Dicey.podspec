Pod::Spec.new do |s|
  s.name             = 'Dicey'
  s.version          = '1.0.1'
  s.summary          = 'A string matching framework. Score strings on similarity.'

  s.description      = <<-DESC
String matching using Sørensen–Dice coefficient algorithm.
                       DESC

  s.homepage         = 'https://github.com/mikaoj/Dicey'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joakim Gyllström' => 'joakim@backslashed.se' }
  s.source           = { :git => 'https://github.com/mikaoj/Dicey.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/*.swift'
end
