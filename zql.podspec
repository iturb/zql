Pod::Spec.new do |s|
  s.name             = "zql"
  s.version          = "1.0"
  s.summary          = "Superb SQLite engine"
  s.description      = <<-DESC
Superb cool SQLite engine for iOS using Objective-C
Super cool really
                       DESC
  s.homepage         = "https://github.com/iturb/zql"
  s.license          = 'MIT'
  s.author           = { "Agustin Iturbide" => "reach@iturbi.de" }
  s.source           = { :git => "https://github.com/iturb/zql.git", :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.source_files = 'zql/Classes/**/*'
end
