# MHCustomTabBarController

![](https://raw.github.com/mhaddl/MHCustomTabBarController/screenshots/screenshots/iOS%20Simulator%20Bildschirmfoto%2009.05.2013%2018.24.40.png)

MHCustomTabBarController is a customizable UITabBarController replacement using Storyboard and segues. It's built with Apples Custom Container ViewController API and so requires iOS 6+.

+ [MHTabBarController](https://github.com/hollance/MHTabBarController "MHTabBarController") (His initials are also M and H ;)) 
+ [CustomTabBarExample](http://www.scott-sherwood.com/ios-5-creating-a-custom-side-tabbar-using-storyboards-and-custom-segues/ "CustomTabBarExample")

## Setup

Have a look at the demoporject and do the following steps.

### Create your Custom TabBarController

![](https://raw.github.com/mhaddl/MHCustomTabBarController/screenshots/screenshots/Screenshot%20on%202013-05-09%20at%2017.48.04.png "Create you custom tabbar controller")

Insert a UIViewController into your storyboard and set the class to "MHCustomTabBarController". Place a UIView (your "UITabBar") into the ViewController. Add UIButtons (your "UITabBarItems") to the view (the buttons must IN the UIView). Add a Container View above (or where you want) to the ViewController. 


### Hook up the outlets

Hook up the outlets in MHCustomTabBarController with your created views in the storyboard.
```objective-c
@property (weak, nonatomic) IBOutlet UIView *container;
@property (nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
```

### Create your ContentViewControllers

![](https://raw.github.com/mhaddl/MHCustomTabBarController/screenshots/screenshots/Screenshot%20on%202013-05-09%20at%2018.17.54.png)

Place your desired ViewControllers into the storyboard and connect them with a UIButton in the CustomTabBarController. Give the created segues identifiers matching this scheme:
* initial, first ViewController = "viewController1"
* second ViewController = "viewController2"
+ ...

Set the style of the segues to "custom" and the class to "MHTabBarSegue".

## License

The MIT License (MIT)

Copyright (c) 2013 Martin Hartl

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


