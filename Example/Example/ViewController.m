//
//  ViewController.m
//  Example
//
//  Created by Jonathan Tribouharet
//

#import "ViewController.h"

@interface ViewController (){
    BOOL isAnimated;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.animatedView setTitle: @"Click to start or stop the animation" forState:UIControlStateNormal];
    [self.animatedView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.shadowAnimation = [JTSlideShadowAnimation new];
    self.shadowAnimation.animatedView = self.animatedView;
    self.shadowAnimation.shadowWidth = 40.;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    isAnimated = YES;
    [self.shadowAnimation start];
}

- (IBAction)didButtonClick:(UIButton *)sender
{
    if(isAnimated){
        [self.shadowAnimation stop];
    }
    else{
        [self.shadowAnimation start];
    }

    isAnimated = !isAnimated;
}

@end
