# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'CatsAndModules_KaterynaAvramenko.xcworkspace'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

xcodeproj 'CatsAndModules_KaterynaAvramenko.xcodeproj'
xcodeproj 'Networking/Networking.xcodeproj'

def shared_pods
  pod 'FirebaseCrashlytics'
  pod 'FirebasePerformance'
end

  pod 'SDWebImageSwiftUI'

target :CatsAndModules_KaterynaAvramenko do
  xcodeproj 'CatsAndModules_KaterynaAvramenko.xcodeproj'
  shared_pods
end

target :Networking do
  xcodeproj 'Networking/Networking.xcodeproj'
  shared_pods
end