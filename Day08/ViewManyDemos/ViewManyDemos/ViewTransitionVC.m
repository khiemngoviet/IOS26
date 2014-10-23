//
//  ViewTransitionVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/20/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "ViewTransitionVC.h"
#import "FlipView.h"
@interface ViewTransitionVC ()
@property (weak, nonatomic) IBOutlet FlipView *flipView;

@end

@implementation ViewTransitionVC

- (void)viewDidLoad
{
    self.flipView.frontImage = [UIImage imageNamed:@"girlA.jpg"];
    self.flipView.backImage = [UIImage imageNamed:@"girlB.jpg"];
   
}

@end
