#
# Be sure to run `pod lib lint StatusBarNotifications.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StatusBarNotifications'
  s.version          = '0.7.0'
  s.summary          = 'Display notifications in iOS Status Bar.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This Pod allow users to display notification message inside iOS Status Bar. You can customize background color, text color, text font and even size of it.
                       DESC

  s.homepage         = 'https://github.com/michaljach/StatusBarNotifications'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'michaljach' => 'michal.jach@ig.com' }
  s.source           = { :git => 'https://github.com/michaljach/StatusBarNotifications.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'StatusBarNotifications/Classes/**/*'
  
  # s.resource_bundles = {
  #   'StatusBarNotifications' => ['StatusBarNotifications/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
