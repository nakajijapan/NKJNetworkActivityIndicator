# Be sure to run `pod lib lint NKJNetworkActivityIndicator.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "NKJNetworkActivityIndicator"
  s.version          = "0.1.1"
  s.summary          = "A network activity manager that show and hide network activity."
  s.description      = <<-DESC
                       NKJNetworkIndicator. A network activity manager that show and hide network activity.

                       Manage with above keys.
                       * name
                       * identifier
                       DESC

  s.homepage         = "https://github.com/nakajijapan/NKJNetworkActivityIndicator"
  s.license          = 'MIT'
  s.author           = { "nakajijapan" => "pp.kupepo.gattyanmo@gmail.com" }
  s.source           = { :git => "https://github.com/nakajijapan/NKJNetworkActivityIndicator.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/nakajijapan'
  s.platform         = :ios, '7.1'
  s.requires_arc     = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'NKJNetworkIndicator' => ['Pod/Assets/*.png']
  }

end
