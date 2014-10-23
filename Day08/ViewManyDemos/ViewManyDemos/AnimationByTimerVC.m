//
//  AnimationByTimerVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/20/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "AnimationByTimerVC.h"
#define VX 10
#define VY 10
@interface AnimationByTimerVC ()
{
    NSTimer *_timer;
    CGRect _boundRect;
    float _vX;
    float _vY;
}
@property (weak, nonatomic) IBOutlet UIImageView *cat;

@end

@implementation AnimationByTimerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    _boundRect = self.view.bounds;
    _vX = 10;
    _vY = 10;
   
    [self startAnimation];
}

- (void) startAnimation
{
    _timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                              target: self
                                            selector: @selector(animateCat:)
                                            userInfo: @{@"ID": @"OX-13", @"Date": [NSDate date]}
                                             repeats: YES];
    [_timer fire];
}
- (NSDictionary *)userInfo {
    return @{ @"StartDate" : [NSDate date] };
}

-(void) animateCat: (NSTimer*)theTimer
{
    CGPoint center = self.cat.center;
    //Hãy tạo hiệu ứng va chạm với thành và phản xạ lại
    CGSize size = self.cat.bounds.size;
    
    float newX = center.x + _vX;
    float newY = center.y + _vY;
    
    if ((newX < size.width /2) || (newX > self.view.bounds.size.width - size.width/2)) {
        _vX = -_vX;
    }
    
    if ((newY < 40+ size.height /2) || (newY > self.view.bounds.size.height - size.height/2)) {
        _vY = -_vY;
    }
    
    newX = center.x + _vX;
    newY = center.y + _vY;
    
    self.cat.center = CGPointMake(newX , newY);
    NSLog(@"%@", theTimer.userInfo);
}
- (IBAction)stopTimer:(id)sender {
    if (_timer.isValid) {
        [_timer invalidate];
        _timer = nil;
    } else {
        [self startAnimation];
    }
}


@end
