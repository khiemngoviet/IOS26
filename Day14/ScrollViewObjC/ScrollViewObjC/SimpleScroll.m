//
//  NormalScroll.m
//  ScrollViewObjC
//
//  Created by techmaster on 8/23/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "SimpleScroll.h"
#define PHOTO_WIDTH 320
#define PHOTO_HEIGHT 480
#define NUM_PHOTO 6
@interface SimpleScroll () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation SimpleScroll

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(PHOTO_WIDTH * NUM_PHOTO, PHOTO_HEIGHT);
    self.scrollView.pagingEnabled = YES;
    for (int i = 1; i < NUM_PHOTO + 1; i++) {
        NSString * fileName = [NSString stringWithFormat:@"%d.jpg", i];
        UIImage *image = [UIImage imageNamed:fileName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake((i - 1) * PHOTO_WIDTH, 0, PHOTO_WIDTH, PHOTO_HEIGHT);
        [self.scrollView addSubview:imageView];
    }
    self.pageControl.numberOfPages = NUM_PHOTO;
}

- (void)viewDidDisappear:(BOOL)animated {
    
    //Chú ý phải có lệnh này để prevent crash ở hàm scrollViewDidScroll khi ViewController
    //trả về NavigationController, lúc này một số sự kiện view scroll vẫn gửi về ViewController
    //trong khi ViewController đã là nil
    self.scrollView.delegate = nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //Chú ý khi ViewController pop trở về NavigationController nếu
    //UIScrollView vẫn tiếp tục gửi sự kiện scrollViewDidScroll thì ứng dụng sẽ bị
    //crash, cần bật Product > Scheme > Edit Scheme > Enable Zombies object để xác định hàm nào gây lỗi, và đối tượng nào bị null khi có lỗi
    self.pageControl.currentPage = self.scrollView.contentOffset.x / PHOTO_WIDTH;
}

- (IBAction)onPageChange:(id)sender {
    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage * PHOTO_WIDTH, 0);
}
@end
