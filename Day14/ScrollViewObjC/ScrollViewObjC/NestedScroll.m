//
//  NestedScroll.m
//  ScrollViewObjC
//
//  Created by techmaster on 8/25/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "NestedScroll.h"
#import "UIColor+Extend.h"

#define NUM_PAGE 5
@interface NestedScroll () <UIScrollViewDelegate>
{
    CGRect viewRec;
    float viewHeight, viewWidth;
    NSArray* colors;
}
@property(weak, nonatomic) UIScrollView *scrollView;
@end

@implementation NestedScroll


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    viewRec = self.view.bounds;
    viewWidth = viewRec.size.width;
    viewHeight = viewRec.size.height;
    colors = @[@"#5E412F", @"#FCEBB6", @"#78C0A8", @"#F07818", @"#F0A830"];
    [self initScrollView];
}

- (void) initScrollView {
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:viewRec];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(NUM_PAGE * viewWidth, viewHeight);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    for (int i = 0; i < NUM_PAGE; i ++) {
        [self addNestedScrollViewAtIndex:i];
    }
    
}

- (void) addNestedScrollViewAtIndex: (int) index {
    UIScrollView *subScrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(index * viewWidth, 0, viewWidth, viewHeight)];
    subScrollView.pagingEnabled = YES;
    subScrollView.backgroundColor = [UIColor initByHexString:colors[index] alpha:1.0];
    
    int numViews = arc4random() % 8 + 1;
    subScrollView.contentSize = CGSizeMake(viewWidth, viewHeight * numViews);
    for (int j = 0; j < numViews; j++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 80)];
        label.center = CGPointMake(viewWidth * 0.5, j * viewHeight + viewHeight * 0.4);
        label.text = [NSString stringWithFormat:@"%d-%d", index, j];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"Courier" size:42];
        [subScrollView addSubview:label];
    }
    [self.scrollView addSubview:subScrollView];
}
@end
