//
//  BlockAnimationVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/17/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "BlockAnimationVC.h"

@interface BlockAnimationVC ()
@property (weak, nonatomic) IBOutlet UIImageView *cat;

@end

@implementation BlockAnimationVC

- (IBAction)animateCat:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        self.cat.center = CGPointMake(300, 400);
    } completion:^(BOOL finished) {
        self.cat.alpha = 0.5;
    }];
    
}

@end
