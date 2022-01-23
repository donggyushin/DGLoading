# DGLoading
A loading view that is shown at center of the current view. 

<div>
<img src="https://user-images.githubusercontent.com/34573243/150687894-d4fe7b65-a697-485a-86a3-5c051d5a7c65.gif" width=250 />
</div>

## Requirements
- iOS 12.0+
- Swift 5.5+
- Xcode 10.0+


## Installation

### SPM
```
File > Add Packages > https://github.com/donggyushin/DGLoading
```

### CocoaPod
```
pod 'DGLoading', :git => 'https://github.com/donggyushin/DGLoading'
```

## Usage
```
DGLoading.shared.startLoading()
DGLoading.shared.stopLoading()

// You can set any UIView you want to use.
DGLoading.shared.customView = customView
```

## Properties

| Properties  | Description | Default | Type |
| ------------- | ------------- | ------------- | ------------- |
| customView  | You can set any custom view you want to use  | nil | UIView |

