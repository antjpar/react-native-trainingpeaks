
Pod::Spec.new do |s|
  s.name         = "RNTrainingPeaks"
  s.version      = "1.0.0"
  s.summary      = "RNTrainingPeaks"
  s.description  = <<-DESC
                  RNTrainingPeaks
                   DESC
  s.homepage     = "https://github.com/valerit/react-native-trainingpeaks"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "valeritsert@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNTrainingPeaks.git", :tag => "master" }
  s.source_files  = "*.{h,m,mm}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  
