# MYBLMusicSDK
[![Version](https://img.shields.io/cocoapods/v/MYBLMusicSDK)](https://cocoapods.org/pods/MYBLMusicSDK)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2011%2B-blue.svg)](https://github.com/shadhin-music/MYBLMusicSDK-iOS/blob/main/LICENSE)
[![Languages](https://img.shields.io/badge/language-%20swift-FF69B4.svg?style=plastic)](#)
[![Code-Size](https://img.shields.io/github/languages/code-size/GakkMedia/MYBLMusicSDK-iOS)](https://github.com/shadhin-music/MYBLMusicSDK-iOS)

## Installation

MYBLMusicSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MYBLMusicSDK'
```
## SDK Initilization 
In Appdelegate SDK initilization process with token and call back delegate 
```ruby
import MYBLShadhinSDK

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //received music control from notification bar
        application.beginReceivingRemoteControlEvents()
        //initilize sdk with token
        ShadhinBL.shared.initialize(with: "", delegate: self)
        return true
    }
    
```
Media control setup from AppDelegate
```ruby
 override func remoteControlReceived(with event: UIEvent?) {
        if let event = event {
            //register event
            ShadhinBL.shared.eventRegister(with: event)
            
        }
    }
```
Get Music home controller you need to pass root navigation controller for navigate music conntroller and mini player always visible from any controller. 
This function return UIViewController you can use this controller as a child or where you show 
```ruby
ShadhinBL.shared.getHome(with: self.navigationController!)->UIViewController
```

There is another method we provide that direct push to navigation controller
```ruby
ShadhinBL.shared.gotoHome(with: self.navigationController!)
```
There is other four feature we implemented that can direct navigate to our controller 

## POPULAR ARTIST 
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.POPULAR_ARTIST.rawValue, navigation: self.navigationController!)
```
## LATEST RELEASE 
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.LATEST_RELEASE.rawValue, navigation: self.navigationController!)
```
## POPULAR VIDEO
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.POPULAR_VIDEO.rawValue, navigation: self.navigationController!)
```
## PODCAST 
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.PODCAST.rawValue, navigation: self.navigationController!)
```
## AMAR TUNE 
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.AMAR_TUNE.rawValue, navigation: self.navigationController!)
 ```
## AMAR TUNE TOP 100
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.AMAR_TUNE_TOP_100.rawValue, navigation: self.navigationController!)
```
## PERMISSION 
Add App Transport Security to your info.plist
```ruby
     <key>NSAppTransportSecurity</key>
    <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    </dict>
```
From your Project target Signing & Capabilities add Background Mood and select 'Audio,Airplay, and picture in picture','Background Processing'


## Author

MD Azizur Rahman, azizur.gakk@gmail.com

## Company

[Gakk Media](https://gakkmedia.com)

## License

MYBLShadhinSDK is available under the MIT license. See the LICENSE file for more info
