
source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'OpenSourcePlayGround' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!
  # Pods for OpenSourcePlayGround
  pod 'AFNetworking'
  pod 'CocoaLumberjack'
  pod 'CYLTabBarController'
  pod 'DoraemonKit/Core', :configurations => ['Debug']
  pod 'DoraemonKit/WithLogger', :configurations => ['Debug']
  pod 'DoraemonKit/WithGPS', :configurations => ['Debug']
  pod 'DoraemonKit/WithLoad', :configurations => ['Debug']
  pod 'DoraemonKit/WithWeex', :configurations => ['Debug']
  pod 'DoraemonKit/WithDatabase', :configurations => ['Debug']
  pod 'DoraemonKit/WithMLeaksFinder', :configurations => ['Debug']
  pod 'FMDB'
  pod 'FLAnimatedImage'
  pod 'JXCategoryView'
  pod 'LookinServer', :configurations => ['Debug']
  pod 'MBProgressHUD'
  pod 'MMKV'
  pod 'MJRefresh'
  pod 'MyLayout'
  pod 'Masonry'
  pod 'pop'
  pod 'IQKeyboardManager'
  pod 'SDWebImage'
  pod 'UITableView+FDTemplateLayoutCell'
  pod 'YPNavigationBarTransition'
  pod 'YTKNetwork'
  pod 'YYKit'
  # pod 'YYModel'
  # pod 'YYWebImage'
end

post_install do |installer|
    ## Fix for XCode 12.5
    find_and_replace("Pods/FBRetainCycleDetector/FBRetainCycleDetector/Layout/Classes/FBClassStrongLayout.mm",
      "layoutCache[currentClass] = ivars;", "layoutCache[(id<NSCopying>)currentClass] = ivars;")
end

def find_and_replace(dir, findstr, replacestr)
  Dir[dir].each do |name|
      FileUtils.chmod("+w", name) #add
      text = File.read(name)
      replace = text.gsub(findstr,replacestr)
      if text != replace
          puts "Fix: " + name
          File.open(name, "w") { |file| file.puts replace }
          STDOUT.flush
      end
  end
  Dir[dir + '*/'].each(&method(:find_and_replace))
end
