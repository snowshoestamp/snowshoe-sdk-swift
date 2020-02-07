# SnowShoe Stamp SDK

The [SnowShoe Stamp](http://www.snowshoestamp.com) is an authentication tool for smartphones and tablets.

<p align="center" >
  <img src="https://beta.snowshoestamp.com/static/api/img/stamp.gif" alt="SnowShoe" title="SnowShoe" width="160" height="284">
</p>

## Installation

SnowShoe Stamp SDK is available through [CocoaPods](http://cocoapods.org). To install
it, add the following line to your Podfile:

```ruby
pod "SnowShoeStampSdk"
```

## Usage

1. To get the app running, you will need to create an app on our site. Go to https://app.snowshoestamp.com/ and Sign In if you have an account or sign up if you don't have one. Once you are logged in, click “New App” to create a new one.

2. After you have created the new application look at it's settings and you will find 'API Key 1' and 'API Key 2'. These can both be used as the api key you will need later when setting up the app.

### Example

To run the example project, clone the repo, run `pod install` from the Example directory, and open `SnowShoe-Swift.xcworkspace`.

### In your own project

The core piece of this library is the `SnowShoeView`, a subclass of `UIView` that automatically detects stamps and handles the API query.

To use it, add this import:

`import SnowShoe_Swift`

Then, assign your api key from the app that you would like to set as the one receiving calls from this app:

```swift
snowShoeView.apiKey = "YOUR_API_KEY"
```

Then, implement `SnowShoeDelegate`, which will be notified when a stamp request is made to the API and when a result comes back:

```swift
public protocol SnowShoeDelegate {
  func onStampRequestMade()
  func onStampResult(result: SnowShoeResult?)
}
```

Then assign the delegate to the `SnowShoeView`:

```swift
snowShoeView.delegate = delegate
```
