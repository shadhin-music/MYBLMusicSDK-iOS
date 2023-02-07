# MYBLMusicSDK
[![Version](https://img.shields.io/cocoapods/v/MYBLMusicSDK)](https://cocoapods.org/pods/MYBLMusicSDK)
[![License](https://img.shields.io/github/license/shadhin-music/MYBLMusicSDK-iOS)](https://github.com/shadhin-music/MYBLMusicSDK-iOS/blob/main/LICENSE)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2011%2B-blue.svg)](https://github.com/shadhin-music/MYBLMusicSDK-iOS/blob/main/LICENSE)
[![Languages](https://img.shields.io/badge/language-%20swift-FF69B4.svg?style=plastic)](#)
[![Code-Size](https://img.shields.io/github/languages/code-size/shadhin-music/MYBLMusicSDK-iOS)](#)

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

We provide that direct push to navigation controller
```ruby
ShadhinBL.shared.gotoHome(with: self.tabBarController, navigationController: self.navigationController!)
```
There is other feature we implemented that can direct navigate to our controller 

## POPULAR ARTIST 
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.POPULAR_ARTIST.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## LATEST RELEASE 
```ruby
 ShadhinBL.shared.openPatch(patchID:FeatureType.LATEST_RELEASE.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## POPULAR VIDEO
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.POPULAR_VIDEO.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## PODCAST 
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.PODCAST.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## AMAR TUNE 
```ruby
ShadhinBL.shared.openPatch(patchID: FeatureType.AMAR_TUNE.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
 ```
## AMAR TUNE TOP 100
```ruby
 ShadhinBL.shared.openPatch(patchID: FeatureType.AMAR_TUNE_TOP_100.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## Goto Radio
```ruby
ShadhinBL.shared.gotoRadio(nav: self.navigationController!,tabController: self.tabBarController)
```
## Stop Music
```ruby
ShadhinBL.shared.stopMusic()
```
## Play Music
```ruby
ShadhinBL.shared.playMusic()
```
## Pause Music
```ruby
ShadhinBL.shared.pauseMusic()
```
## Clear All Cache
```ruby
ShadhinBL.shared.clearAllCache()
```
## Open RC Code
```ruby
ShadhinBL.shared.openPatch(patchID: "MjM1OV9QREJD", navigationController: self.navigationController!, tabController: self.tabBarController)
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

MYBLMusicSDK is available under the MIT license. See the LICENSE file for more info
