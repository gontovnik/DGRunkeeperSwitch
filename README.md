# DGRunkeeperSwitch
Runkeeper design switch control (two part segment control) developed in Swift 2.0

![alt tag](https://raw.githubusercontent.com/gontovnik/DGRunkeeperSwitch/master/DGRunkeeperSwitch.png)
![alt tag](https://raw.githubusercontent.com/gontovnik/DGRunkeeperSwitch/master/DGRunkeeperSwitch.gif)

## Requirements
* Xcode 7-beta or higher
* iOS 8.0 or higher (May work on previous versions, just did not test it. Feel free to edit it).
* ARC
* Swift 2.0

## Demo

Open and run the DGRunkeeperSwitchExample project in Xcode to see DGRunkeeperSwitch in action.

## Installation

### Manual

All you need to do is drop DGRunkeeperSwitch.swift file into your project

### CocoaPods

``` ruby
pod "DGRunkeeperSwitch", "~> 1.1"
```

## Example usage

``` swift
let runkeeperSwitch = DGRunkeeperSwitch(leftTitle: "Feed", rightTitle: "Leaderboard")
runkeeperSwitch.backgroundColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
runkeeperSwitch.selectedBackgroundColor = .whiteColor()
runkeeperSwitch.titleColor = .whiteColor()
runkeeperSwitch.selectedTitleColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
runkeeperSwitch.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
runkeeperSwitch.frame = CGRect(x: 50.0, y: 20.0, width: view.bounds.width - 100.0, height: 30.0)
runkeeperSwitch.autoresizingMask = [.FlexibleWidth]
view.addSubview(runkeeperSwitch)
```

## Contribution

You are welcome to fork and submit pull requests!

## Contact

Danil Gontovnik

- https://github.com/gontovnik
- https://twitter.com/gontovnik
- http://gontovnik.com/
- gontovnik.danil@gmail.com

## License

The MIT License (MIT)

Copyright (c) 2015 Danil Gontovnik

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
