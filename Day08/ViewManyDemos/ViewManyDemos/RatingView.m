//
//  RatingView.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/20/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "RatingView.h"

@interface RatingView()
{
    float _fullWidth;
}
@end
@implementation RatingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) awakeFromNib {
    _fullWidth = self.bounds.size.width;
}

-(void) setValue:(float)value {
    if (value < 0 || value > 5) {
        return;
    } else {
        _value = value;
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _fullWidth*_value/5.0, self.frame.size.height);
        
    }
}


@end
