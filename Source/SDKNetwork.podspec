Pod::Spec.new do |s|
  s.name             = 'SDKNetwork'
  s.version          = '4.0.0'
  s.summary          = 'Thats the Network module.'

  s.description      = "SDKNetwork é um framework para facilitar as chamadas de API em Swift."

  s.homepage         = 'https://github.com/PedroRoca7/Network'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Seu Nome' => 'seu@email.com' }
  s.source           = { :git => 'https://github.com/PedroRoca7/Network.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.4'
  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'

end
