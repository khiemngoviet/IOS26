//
//  InfiniteScroll.m
//  ScrollViewObjC
//
//  Created by techmaster on 8/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "InfiniteScroll.h"
#define PHOTO_WIDTH 320
#define PHOTO_HEIGHT 480
#define NUM_PHOTO 6
typedef enum : NSUInteger {
    ScrollDirection_Horizon,
    ScrollDirection_Vertical
} ScrollDirection;


@interface InfiniteScroll () <UIScrollViewDelegate>
@property (weak, nonatomic) UIScrollView* scrollView;
@property (assign, nonatomic) ScrollDirection *scrollDirection;
@end

@implementation InfiniteScroll

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initScrollView];
}

- (void) initScrollView
{
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    self.scrollDirection = ScrollDirection_Horizon;
    if (self.scrollDirection == ScrollDirection_Horizon) {
        scrollView.contentSize = CGSizeMake((NUM_PHOTO + 2) * PHOTO_WIDTH, PHOTO_HEIGHT);
    } else {
        scrollView.contentSize = CGSizeMake(PHOTO_WIDTH, (NUM_PHOTO + 2) * PHOTO_HEIGHT);
    }
    
    [self addPhoto:[self fileByIndex:NUM_PHOTO]
           atIndex:0];
    for (int i = 1; i < NUM_PHOTO + 1; i++) {
        
        [self addPhoto:[self fileByIndex:i]
               atIndex:i];
    }
    [self addPhoto:[self fileByIndex:1]
           atIndex:NUM_PHOTO + 1];
    
    //Chuyen den khung so 1
    [self.scrollView scrollRectToVisible:CGRectMake(PHOTO_WIDTH,0,PHOTO_WIDTH,PHOTO_HEIGHT) animated:NO];
}
- (NSString*) fileByIndex: (int) index {
    NSString* test = [NSString stringWithFormat:@"%d.jpg", index];
    return test;
}
- (void) addPhoto: (NSString*) file
          atIndex: (NSInteger) index
{
    UIImageView * photo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:file]];
    
    if (self.scrollDirection == ScrollDirection_Horizon) {
        photo.frame = CGRectMake(index * PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT);
    } else {
        photo.frame = CGRectMake(0, index * PHOTO_HEIGHT, PHOTO_WIDTH, PHOTO_HEIGHT);
    }
    
   [self.scrollView addSubview:photo];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender {

    CGRect rec;
	// The key is repositioning without animation
    
    if (self.scrollDirection == ScrollDirection_Horizon) {
        if (self.scrollView.contentOffset.x <= 0) {
            rec = CGRectMake(NUM_PHOTO * PHOTO_WIDTH,0,PHOTO_WIDTH,PHOTO_HEIGHT);
        } else if (self.scrollView.contentOffset.x >= NUM_PHOTO * PHOTO_WIDTH) {
            rec = CGRectMake(PHOTO_WIDTH,0,PHOTO_WIDTH,PHOTO_HEIGHT);
        }
    } else {
        if (self.scrollView.contentOffset.y <= 0) {
            rec = CGRectMake(0,NUM_PHOTO * PHOTO_HEIGHT,PHOTO_WIDTH,PHOTO_HEIGHT);
        } else if (self.scrollView.contentOffset.y >= NUM_PHOTO * PHOTO_HEIGHT) {
            rec = CGRectMake(0,PHOTO_HEIGHT,PHOTO_WIDTH,PHOTO_HEIGHT);
        }
    }
    [self.scrollView scrollRectToVisible:rec
                                animated:NO];
}
@end
