# NKJNetworkActivityIndicator

[![CI Status](http://img.shields.io/travis/nakajijapan/NKJNetworkActivityIndicator.svg?style=flat)](https://travis-ci.org/nakajijapan/NKJNetworkActivityIndicator)
[![Version](https://img.shields.io/cocoapods/v/NKJNetworkActivityIndicator.svg?style=flat)](http://cocoapods.org/pods/NKJNetworkActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/NKJNetworkActivityIndicator.svg?style=flat)](http://cocoapods.org/pods/NKJNetworkActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/NKJNetworkActivityIndicator.svg?style=flat)](http://cocoapods.org/pods/NKJNetworkActivityIndicator)

NKJNetworkActivityIndicator. A network activity indicator that manage some activities, show and hide network indicator.

Manage with above keys.
* name
* identifier

I want to manage network indicator seperately by the content, but same viewcontroller.


## Usage

### Start Indicator

```objc
[[NKJNetworkActivityIndicator sharedIndicator] startActivityWithName:NSStringFromClass([self class])
identifier:self.identifier];

```

### Stop Indicator

```objc
[[NKJNetworkActivityIndicator sharedIndicator] stopActivityWithName:NSStringFromClass([self class])
identifier:self.identifier];

```

### Connecting Check

```objc
if ([[NKJNetworkActivityIndicator sharedIndicator] connectingActivityWithName:NSStringFromClass([self class]) identifier:self.identifier]) {
// code
}
```


## Requirements

Xcode 6 is required.

## Installation

NKJNetworkActivityIndicator is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NKJNetworkActivityIndicator"
```

## Author

nakajijapan, pp.kupepo.gattyanmo@gmail.com

## License

NKJNetworkActivityIndicator is available under the MIT license. See the LICENSE file for more info.
