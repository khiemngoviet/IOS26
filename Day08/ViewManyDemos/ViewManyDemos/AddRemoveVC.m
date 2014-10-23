//
//  AddRemoveVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/17/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "AddRemoveVC.h"

@interface AddRemoveVC ()
{
    UIView *_currentTopView;
    float _currentGrayColor;
}
@end

@implementation AddRemoveVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    _currentTopView = self.view;
    _currentGrayColor = 1.0;
}

- (IBAction)addSubView:(id)sender {

    if ( _currentTopView.bounds.size.width < 40) return;
    
    float width = _currentTopView.bounds.size.width - 20;
    UIView *childView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, width, width)];
    childView.backgroundColor = [UIColor colorWithRed:_currentGrayColor
                                                green:_currentGrayColor
                                                 blue:_currentGrayColor
                                                alpha:1.0];
    [_currentTopView addSubview:childView];
    childView.center = CGPointMake(_currentTopView.bounds.size.width/2, _currentTopView.bounds.size.height/2);
    _currentGrayColor -= 0.1;
    _currentTopView = childView;
    
}
- (IBAction)removeSubView:(id)sender {
    UIView * tobeRemovedView = _currentTopView;
    if (tobeRemovedView != self.view) {
         _currentTopView = _currentTopView.superview;
        [tobeRemovedView removeFromSuperview];
        _currentGrayColor += 0.1;
    }    
}

@end
