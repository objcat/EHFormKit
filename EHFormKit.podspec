Pod::Spec.new do |s|
  s.name         = "EHFormKit"
  s.version      = "1.0.0"
  s.summary      = "EHFormKit for iOS"
  s.description  = <<-DESC
                   EHFormKit for iOS
                   DESC
  s.homepage     = "https://github.com/objcat/EHFormKit"
  s.license      = 'MIT'
  s.author       = { "objcat" => "objcat2024@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => 'https://github.com/objcat/EHFormKit.git', :tag => s.version }
  s.requires_arc = true
  s.source_files  = "EHFormKit/**/*.{h,m}"
end
