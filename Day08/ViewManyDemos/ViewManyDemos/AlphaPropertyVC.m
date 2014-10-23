//
//  AlphaPropertyVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/17/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "AlphaPropertyVC.h"

@interface AlphaPropertyVC ()
@property (weak, nonatomic) IBOutlet UIImageView *coolGirl;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;

@end

@implementation AlphaPropertyVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.alphaSlider.value = self.coolGirl.alpha;
}


- (IBAction)changeAlpha:(id)sender {
    self.coolGirl.alpha = [(UISlider*) sender value];
}

@end
