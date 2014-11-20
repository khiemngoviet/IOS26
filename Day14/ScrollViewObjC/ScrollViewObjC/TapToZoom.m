//
//  TapToZoom.m
//  ScrollViewObjC
//
//  Created by techmaster on 8/21/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "TapToZoom.h"
#define ZOOM_STEP 1.5

@interface TapToZoom () <UIScrollViewDelegate, UIGestureRecognizerDelegate>
//Ở đây chỉ cần khai báo weak, vì các control này sẽ được gắn lên ViewController.view
//ViewController.view sẽ có con trỏ strong giữ lại các property này
@property (weak, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) UIImageView *photo;
@property (weak, nonatomic) UILabel* scaleLabel;
@end

@implementation TapToZoom

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //Configure scrollView
    //Chú ý: phải tạo local pointer trước, không gán trực tiếp đối tượng vào weak property
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.delegate = self;
    scrollView.minimumZoomScale = 0.1;
    scrollView.maximumZoomScale = 10;
    scrollView.zoomScale = 1.0;
    scrollView.clipsToBounds = YES;
    
    UIImageView* photo = [[UIImageView alloc] initWithFrame:scrollView.frame];
    photo.image = [UIImage imageNamed:@"playboy.jpg"];
    photo.contentMode = UIViewContentModeScaleAspectFit;
    //Phải có 2 lệnh dưới để hứng sự kiện người dùng tap vào photo
    photo.userInteractionEnabled = YES;
    photo.multipleTouchEnabled = YES;
    
    
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.delegate = self;
    [photo addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onDoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.delegate = self;
    [photo addGestureRecognizer:doubleTap];
    
    //Nếu không có lệnh này, thì single tap sẽ nhận rồi sau đó double tap cũng nhận! Hình phóng ra rồi thu lại !
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    [scrollView addSubview:photo];
    [self.view addSubview:scrollView];
    
    //Sau khi scrollView, photo được gắn vào View cha, có con trỏ strong thì chúng
    //ta mới gán vào weak property
    self.scrollView = scrollView;
    self.photo = photo;
    
    UILabel* scaleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    scaleLabel.textAlignment = NSTextAlignmentRight;
    scaleLabel.text = [NSString stringWithFormat:@"%2.2f", scrollView.zoomScale];
    
    UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithCustomView:scaleLabel];
    
    [self.navigationItem setRightBarButtonItem:barButton];
    self.scaleLabel = scaleLabel;
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.photo;
}
- (void) onTap: (UITapGestureRecognizer*) tap {
    CGPoint tapPoint = [tap locationInView:self.photo];
    NSLog(@"x = %2.2f, y = %2.2f", tapPoint.x, tapPoint.y);
    
    float newScale = [self.scrollView zoomScale] * ZOOM_STEP;
    [self zoomRectForScale:newScale withCenter:[tap locationInView:self.photo]];
}

- (void) onDoubleTap: (UITapGestureRecognizer*) tap {
    
    float newScale = [self.scrollView zoomScale] / ZOOM_STEP;
    [self zoomRectForScale:newScale withCenter:[tap locationInView:self.photo]];

}
#pragma mark Utility methods

- (void)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    // the zoom rect is in the content view's coordinates.
    //    At a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
    //    As the zoom scale decreases, so more content is visible, the size of the rect grows.
    //Chú ý: nên tạo một local struct để lấy size tốc độ sẽ tốt hơn, không nên self.scrollView.bounds.size / scale
    
    CGSize scrollViewSize = self.scrollView.bounds.size;
    zoomRect.size.height = scrollViewSize.height / scale;
    zoomRect.size.width  = scrollViewSize.width  / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    [self.scrollView zoomToRect:zoomRect animated:YES];
    /*
     - (void)zoomToRect:(CGRect)rect animated:(BOOL)animated
     Parameters
     rect
     A rectangle defining an area of the content view. The rectangle should be in the coordinate space of the view returned by viewForZoomingInScrollView:
     ở đây viewForZoomingInScrollView trả về self.photo
     */
    self.scaleLabel.text = [NSString stringWithFormat:@"%2.2f", self.scrollView.zoomScale];
}
@end
