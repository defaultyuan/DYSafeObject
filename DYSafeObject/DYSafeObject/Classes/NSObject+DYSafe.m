//
//  NSObject+DYSafe.m
//  DYSafeObjectDemo
//
//  Created by defaultyuan on 2018/5/31.
//  Copyright © 2018年 defaultyuan. All rights reserved.
//

#import "NSObject+DYSafe.h"
#import "NSObject+DYSwizzle.h"

@implementation NSObject (DYSafe)

/*!
 * 处理NSNull 异常
 */

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[self class] swizzleSEL:@selector(forwardingTargetForSelector:) withSEL:@selector(dy_forwardingTargetForSelector:)];
    });
}

- (id)dy_forwardingTargetForSelector:(SEL)aSelector {
    static NSArray *classes = nil;
    if(classes == nil) {
        classes = @[NSStringFromClass([NSNull class]),
                    NSStringFromClass([NSDictionary class]),
                    NSStringFromClass([NSArray class]),
                    NSStringFromClass([NSNumber class])
                    ];
    }

    if([classes containsObject:NSStringFromClass([self class])] == NO) {
        return [self dy_forwardingTargetForSelector:aSelector];
    }

    NSArray *targetObjs = @[@{}, @[], @"", @0];
    for(id obj in targetObjs) {
        if([obj respondsToSelector:aSelector]) {
            NSLog(@"提示！: %@ 转发给 %@", [self class], [obj class]);
            return obj;
        }
    }
    return [self dy_forwardingTargetForSelector:aSelector];
}

@end
