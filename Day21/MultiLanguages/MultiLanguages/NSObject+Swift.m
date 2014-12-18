//
//  UIResponder+Swift.m
//
//  Created by ToKoRo on 2014-07-18.
//  Modified by Cuong, cuong@techmaster.vn

#import "NSObject+Swift.h"

@implementation NSObject (Swift)
//name is name of class that is prefixed by @objc
+ (id)createObject: (NSString*) name {
    return [NSClassFromString(name) new];
}
//name is name of class that is not prefixed by @objc
+ (id)createObject2: (NSString*) name {
    NSString* appName = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleName"];
    return [NSClassFromString([NSString stringWithFormat:@"%@.%@", appName, name]) new];
}
- (id)swift_performSelector:(SEL)selector
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [self performSelector:selector];
#pragma clang diagnostic pop
}

- (id)swift_performSelector:(SEL)selector withObject:(id)object
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [self performSelector:selector withObject:object];
#pragma clang diagnostic pop
}

- (void)swift_performSelector:(SEL)selector withObject:(id)object afterDelay:(NSTimeInterval)delay
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [self performSelector:selector withObject:object afterDelay:delay];
#pragma clang diagnostic pop
}

@end
