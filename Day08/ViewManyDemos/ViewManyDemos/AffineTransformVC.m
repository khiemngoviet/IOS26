//
//  AffineTransformVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/17/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "AffineTransformVC.h"

@interface AffineTransformVC ()
@property (weak, nonatomic) IBOutlet UIImageView *cat;
@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;

@end

@implementation AffineTransformVC
- (void) viewDidLoad
{
    [self rotateAndScale];
}
- (IBAction)rotate:(UISlider *)sender {
    
    [self rotateAndScale];
}

- (IBAction)scale:(UISlider *)sender {
    //self.cat.transform = CGAffineTransformMakeScale(sender.value * 4, sender.value * 4);
    [self rotateAndScale];
}

- (void) rotateAndScale
{
    float scaleRatio = self.scaleSlider.value * 4;
    self.cat.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI* self.rotateSlider.value),
                                                 CGAffineTransformMakeScale(scaleRatio, scaleRatio));
   
}

@end
