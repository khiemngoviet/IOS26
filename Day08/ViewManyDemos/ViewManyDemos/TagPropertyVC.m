//
//  TagPropertyVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/17/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "TagPropertyVC.h"
#import "NumericButton.h"
@interface TagPropertyVC ()

@end

@implementation TagPropertyVC

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
    NumericButton *button8 = (NumericButton *)[self.view viewWithTag:8];
    NumericButton *button9 = (NumericButton *)[self.view viewWithTag:9];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)numericTap:(id)sender {
    
}

@end
