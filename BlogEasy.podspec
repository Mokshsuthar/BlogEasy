#
# Be sure to run `pod lib lint BlogEasy.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BlogEasy'
  s.version          = '0.1.0'
  s.summary          = 'A Fast and Customizable Solution for Stunning Blog Views'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Introducing BlogEasy, a revolutionary framework designed to effortlessly create visually stunning and highly customizable blog views. With BlogEasy, bloggers and developers can save time and effort by streamlining the blog creation process while achieving breathtaking results.\nSpeed and Simplicity:\nBlogEasy prides itself on its user-friendly interface and intuitive design. Gone are the days of struggling with complex coding or spending hours tinkering with layouts. This framework enables bloggers of all skill levels to quickly set up and launch their blogs without any hassle. Say goodbye to tedious manual formatting and welcome a streamlined blogging experience.\nFully Customizable:\nBlogEasy puts the power of customization in your hands. With an extensive array of pre-designed templates and themes, you can choose the perfect style that matches your blog\'s personality and content. From fonts, colors, and backgrounds to header designs and post layouts, every aspect of your blog view can be tailored to your liking. Express your unique voice and create a blog that resonates with your audience.'

  s.homepage         = 'https://github.com/Mokshsuthar/BlogEasy/tree/main'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Moksh' => 'suthermukesh@gmail.com' }
  s.source           = { :git => 'https://github.com/Moksh/BlogEasy.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.0'

  s.source_files = 'Classes/**/*'
  s.swift_version = '5.0'
  # s.resource_bundles = {
  #   'BlogEasy' => ['BlogEasy/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Kingfisher'
end
