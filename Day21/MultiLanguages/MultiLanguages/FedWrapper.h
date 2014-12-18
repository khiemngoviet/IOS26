//
//  FedWrapper.h
//  MultiLanguages
//
//  Created by cuong minh on 12/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef __cplusplus
#include "Fed.h"
#endif
@interface FedWrapper : NSObject
- (int) areaOfRect: (int)x :(int)y;
@end


@interface ObjVector : NSObject
{
    @public
    #ifdef __cplusplus
    CVector* cvector;
    #endif
}

- (instancetype) init: (int)x andY:(int)y;

- (ObjVector*) add: (ObjVector*) lhs;



@end
