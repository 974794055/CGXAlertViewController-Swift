Pod::Spec.new do |s|
  s.name         = "CGXAlertViewController-Swift"    #存储库名称
  s.version      = "1.0.2"      #版本号，与tag值一致
  s.summary      = "a CGXAlertViewController系统弹框"  #简介
  s.description  = "a CGXAlertViewController系统弹框封装"  #描述
  s.homepage     = "https://github.com/974794055/CGXAlertViewController-Swift"      #项目主页，不是git地址
  s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
  s.author             = { "974794055" => "974794055@qq.com" }  #作者
  s.platform     = :ios, "8.0"                  #支持的平台和版本号
  s.swift_version = "5.0"
  s.source       = { :git => "https://github.com/974794055/CGXAlertViewController-Swift.git", :tag =>        s.version }         #存储库的git地址，以及tag值
  s.source_files  =  "CGXAlertViewController", "CGXAlertViewController/**/*.{swift}" #需要托管的源代码路径
   s.requires_arc = true #是否支持ARC
   s.frameworks = 'UIKit'
end