//
//  FlipView.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/20/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "FlipView.h"
@interface FlipView()
{
    UIImageView *_frontView;
    UIImageView *_backView;
    UIImageView *_backupView;
    BOOL _isFrontFace;

}
@end

@implementation FlipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"Do something");
    }
    return self;
}

- (void) awakeFromNib {
    NSLog(@"awake From Nib");
    UITapGestureRecognizer *tapA = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip:)];
    
    [self addGestureRecognizer:tapA];

    _frontView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"girlA.jpg"]];
    _frontView.frame = self.bounds;
    [self addSubview:_frontView];
    
    _backView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"girlB.jpg"]];
    _backView.frame = self.bounds;
    _isFrontFace = YES;

}

-(void) flip: (UITapGestureRecognizer *) gesture
{
    if (_isFrontFace){
        [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            [self addSubview:_backView];
            _backupView = _frontView;
            [_frontView removeFromSuperview];
            
        } completion:^(BOOL finished){
            _isFrontFace = NO;
        }];
        
    } else {
        [UIView transitionWithView:self duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
            [self addSubview:_backupView];
            _backupView = _backView;
            [_backView removeFromSuperview];
            
        } completion:^(BOOL finished){
            _isFrontFace = YES;
        }];
    }
}



@end
