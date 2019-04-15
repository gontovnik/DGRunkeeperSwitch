# DGRunkeeperSwitch
Runkeeper design switch control (two part segment control) developed in Swift 2.0 and I (@aakpro) changed it to swift 5.0 and still waiting for main repository owner to merge it.
#### So here is new version of DGRunkeeper in swift 5
#
#
#

![Preview 1](https://raw.githubusercontent.com/gontovnik/DGRunkeeperSwitch/master/DGRunkeeperSwitch.png)
![Preview 2](https://raw.githubusercontent.com/gontovnik/DGRunkeeperSwitch/master/DGRunkeeperSwitch.gif)

## Requirements
* Xcode 10.2 or higher
* iOS 10.0 or higher (May work on previous versions, just did not test it. Feel free to edit it).
* ARC
* Swift 5.0 
## Demo

Open and run the DGRunkeeperSwitchExample project in Xcode to see DGRunkeeperSwitch in action.

## Installation

### Manual

All you need to do is drop DGRunkeeperSwitch.swift file into your project

### CocoaPods

``` ruby
pod "DGRunkeeperSwitch", "~> 1.1.4"
```

## Example usage
### Using DGRunkeeperSwitch as a titleView
``` swift
let runkeeperSwitch = DGRunkeeperSwitch(titles: ["Feed", "Leaderboard"])
runkeeperSwitch.backgroundColor = UIColor(red: 229.0/255.0, green: 163.0/255.0, blue: 48.0/255.0, alpha: 1.0)
runkeeperSwitch.selectedBackgroundColor = .white
runkeeperSwitch.titleColor = .white
runkeeperSwitch.selectedTitleColor = UIColor(red: 255.0/255.0, green: 196.0/255.0, blue: 92.0/255.0, alpha: 1.0)
runkeeperSwitch.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
runkeeperSwitch.frame = CGRect(x: 30.0, y: 40.0, width: 200.0, height: 30.0)
runkeeperSwitch.addTarget(self, action: #selector(ViewController.switchValueDidChange(sender:)), for: .valueChanged)
navigationItem.titleView = runkeeperSwitch
```

### Using as a stand alone control
``` swift
let runkeeperSwitch2 = DGRunkeeperSwitch()
runkeeperSwitch2.titles = ["Daily", "Weekly", "Monthly", "Yearly"]
runkeeperSwitch2.backgroundColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
runkeeperSwitch2.selectedBackgroundColor = .white
runkeeperSwitch2.titleColor = .white
runkeeperSwitch2.selectedTitleColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
runkeeperSwitch2.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
runkeeperSwitch2.frame = CGRect(x: 50.0, y: 20.0, width: view.bounds.width - 100.0, height: 30.0)
runkeeperSwitch2.autoresizingMask = [.flexibleWidth] // This is needed if you want the control to resize
view.addSubview(runkeeperSwitch2)
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
