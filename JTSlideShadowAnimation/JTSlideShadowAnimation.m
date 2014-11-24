//
//  JTSlideShadowAnimation.m
//  JTSlideShadowAnimation
//
//  Created by Jonathan Tribouharet
//

#import "JTSlideShadowAnimation.h"

@interface JTSlideShadowAnimation(){
    CABasicAnimation *currentAnimation;
}

@end

@implementation JTSlideShadowAnimation

- (id)init
{
    self = [super init];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (void)commonInit
{
    self.shadowBackgroundColor = [UIColor colorWithWhite:1. alpha:.3];
    self.shadowForegroundColor = [UIColor whiteColor];
    
    self.shadowWidth = 20.;
    self.repeatCount = HUGE_VALF;
    self.duration = 3.;
}

- (void)start
{
    if(!self.animatedView){
        NSLog(@"JTSlideShadowAnimation no view to animate");
        return;
    }
    
    [self stop];
    
    CAGradientLayer *gradientMask = [CAGradientLayer layer];
    gradientMask.frame = self.animatedView.bounds;
    
    CGFloat gradientSize = self.shadowWidth / self.animatedView.frame.size.width;
    
    NSArray *startLocations = @[
                                @0,
                                [NSNumber numberWithFloat:(gradientSize / 2.)],
                                [NSNumber numberWithFloat:gradientSize]
                                ];
    NSArray *endLocations = @[
                              [NSNumber numberWithFloat:(1. - gradientSize)],
                              [NSNumber numberWithFloat:(1. - (gradientSize / 2.))],
                              @1
                              ];
    
    
    gradientMask.colors = @[
                            (id)self.shadowBackgroundColor.CGColor,
                            (id)self.shadowForegroundColor.CGColor,
                            (id)self.shadowBackgroundColor.CGColor
                            ];
    gradientMask.locations = startLocations;
    gradientMask.startPoint = CGPointMake(0 - (gradientSize * 2), .5);
    gradientMask.endPoint = CGPointMake(1 + gradientSize, .5);
    
    self.animatedView.layer.mask = gradientMask;
    
    currentAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    currentAnimation.fromValue = startLocations;
    currentAnimation.toValue = endLocations;
    currentAnimation.repeatCount = self.repeatCount;
    currentAnimation.duration  = self.duration;
    currentAnimation.delegate = self;
    
    [gradientMask addAnimation:currentAnimation forKey:@"JTSlideShadowAnimation"];
}

- (void)stop
{
    if(self.animatedView && self.animatedView.layer.mask){
        [self.animatedView.layer.mask removeAnimationForKey:@"JTSlideShadowAnimation"];
        self.animatedView.layer.mask = nil;
        currentAnimation = nil;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)finished
{
    if(anim == currentAnimation){
        [self stop];
    }
}

@end
