//
//  FedWrapper.m
//  MultiLanguages
//
//  Created by cuong minh on 12/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "FedWrapper.h"
//#import "Fed.h"
@implementation FedWrapper
- (int) areaOfRect: (int)x :(int)y {
    Rectangle rect;
    rect.set_values (x, y);
    return rect.area();
}
@end

@implementation ObjVector
- (instancetype) init: (int)x andY:(int)y {
    if (self = [super init]) {
        cvector = new CVector(x, y);
    }
    return self;
}

- (NSString*) description {
    return [NSString stringWithFormat:@"%d - %d", self->cvector->x, self->cvector->y];
}
- (ObjVector*) add: (ObjVector*) lhs {
    CVector temp =  *(self->cvector) + *(lhs->cvector);
    ObjVector *result = [[ObjVector alloc] init:temp.x andY:temp.y];
    return result;
}


- (void)dealloc
{
    delete cvector;
}


@end
