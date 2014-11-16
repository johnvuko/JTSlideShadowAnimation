//
//  ViewController.h
//  Example
//
//  Created by Jonathan Tribouharet
//

#import <UIKit/UIKit.h>

#import "JTSlideShadowAnimation.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *animatedView;

@property (strong, nonatomic) JTSlideShadowAnimation *shadowAnimation;

- (IBAction)didButtonClick:(UIButton *)sender;

@end

