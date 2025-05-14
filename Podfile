# Uncomment the next line to define a global platform for your project
# Podfile
platform :ios, '13.0'
inhibit_all_warnings!

target 'guide-app-ios' do
  use_frameworks!
  use_modular_headers!

  pod 'MapLibre', '~> 6.13'
  # если понадобятся и другие Pods – добавляйте здесь
end

post_install do |installer|
  # принудительно выставляем iOS 13 для всех сборок Pods
  installer.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end

  # главное: убираем quarantine-флаг,
  # чтобы скрипт “[CP] Embed Pods Frameworks” мог скопировать MapLibre.framework
  system('xattr -dr com.apple.quarantine "${PWD}/Pods"')
end




