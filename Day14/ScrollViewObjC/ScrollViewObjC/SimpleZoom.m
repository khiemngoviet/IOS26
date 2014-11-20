//
//  SimpleZoom.m
//  ScrollViewObjC
//
//  Created by techmaster on 8/21/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "SimpleZoom.h"

@interface SimpleZoom () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end

@implementation SimpleZoom


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.scrollView.minimumZoomScale = 0.25;
    self.scrollView.maximumZoomScale = 4.0;
    
    
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.photo;
}

@end
