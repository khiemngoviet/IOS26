//
//  RatingViewVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/20/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "RatingViewVC.h"
#import "RatingView.h"
@interface RatingViewVC ()
@property (weak, nonatomic) IBOutlet RatingView *ratingView;
@end

@implementation RatingViewVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (IBAction)changeRating:(UISlider *)sender {
    self.ratingView.value = sender.value;
}

@end
