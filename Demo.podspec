Pod::Spec.new do |s|
s.name             = "Demo"    #名称
s.version          = "1.0.0"             #版本号
s.summary          = "Just Testing."     #简短介绍，下面是详细介绍
s.description      = <<-DESC
Testing Private Podspec.

* Markdown format.
* Don't worry about the indent, we strip it!
DESC

s.homepage         = "https://github.com/lsw891227/Demo"
s.license          = { :type => 'MIT', :file =>'README.md' }
s.author           = { "liushuangwei" => "932181121@qq.com" }                   #作者信息
s.source           = { :git => "https://github.com/lsw891227/Demo.git", :tag => "1.0.0" }

s.platform     = :ios, '8.0'            #支持的平台及版本
s.requires_arc = true                   #是否使用ARC，如果指定具体文件，则具体的问题使用ARC

s.source_files = 'Demo/UIView+MLKit.{h,m}'

s.frameworks = 'UIKit'                  #所需的framework，多个用逗号隔开

end
