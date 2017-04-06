Pod::Spec.new do |s|
   s.name       = 'ZYMaskView'
   s.version    = '1.0.0'
   s.summary    = 'Add the empty masked view.'
   s.homepage   = 'https://github.com/SilenceZhou/ZYMaskView'
   s.license    = 'MIT'
   s.platform   = :ios
   s.author     = {'SilenceZhou' => '1063123603@qq.com'}
   s.ios.deployment_target = '9.0'
   s.source     = {:git => 'https://github.com/SilenceZhou/ZYMaskView.git', :tag => s.version}
   s.frameworks   = 'UIKit'
   s.requires_arc= true
   s.source_files = 'ZYMaskView/*.{h,m}'
end
