# JTSlideShadowAnimation

[![CI Status](http://img.shields.io/travis/jonathantribouharet/JTSlideShadowAnimation.svg)](https://travis-ci.org/jonathantribouharet/JTSlideShadowAnimation)
![Version](https://img.shields.io/cocoapods/v/JTSlideShadowAnimation.svg)
![License](https://img.shields.io/cocoapods/l/JTSlideShadowAnimation.svg)
![Platform](https://img.shields.io/cocoapods/p/JTSlideShadowAnimation.svg)

JTSlideShadowAnimation allow you to reproduce the famous "slide to unlock effect" on iOS.

## Installation

With [CocoaPods](http://cocoapods.org/), add this line to your Podfile.

	pod 'JTSlideShadowAnimation', '~> 1.0'

## Screenshots

![Example](./Screens/example.gif "Example View")

## Usage

### Basic usage

Just import `JTSlideShadowAnimation.h`.

```objective-c
#import "JTSlideShadowAnimation.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *animatedView;

@property (strong, nonatomic) JTSlideShadowAnimation *shadowAnimation;

@end
```

Assign the view you want to animate and start the animation.

```objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.shadowAnimation = [JTSlideShadowAnimation new];
    self.shadowAnimation.animatedView = self.animatedView;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self.shadowAnimation start];
}
```

### Customization

You can easily customize the animation.

- `shadowBackgroundColor`
- `shadowForegroundColor`
- `shadowWidth`
- `repeatCount`
- `duration`

Example:

```objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.shadowAnimation = [JTSlideShadowAnimation new];
    self.shadowAnimation.animatedView = self.animatedView;

    self.shadowAnimation.shadowBackgroundColor = [UIColor colorWithWhite:0. alpha:.3];
    self.shadowAnimation.shadowForegroundColor = [UIColor blackColor];
    self.shadowAnimation.shadowWidth = 40.;
    self.shadowAnimation.repeatCount = 3;
    self.shadowAnimation.duration = 3.;

    [self.shadowAnimation start];
}
```

## Requirements

- iOS 7 or higher
- Automatic Reference Counting (ARC)

## Known Issues

- Animation stop when the application go in background, you have to restart it manually

## Author

- [Jonathan Tribouharet](https://github.com/jonathantribouharet) ([@johntribouharet](https://twitter.com/johntribouharet))

## License

JTSlideShadowAnimation is released under the MIT license. See the LICENSE file for more info.


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/jonathantribouharet/jtslideshadowanimation/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

