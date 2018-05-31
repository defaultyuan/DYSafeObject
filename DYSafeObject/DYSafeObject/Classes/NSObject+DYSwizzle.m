//
//  NSObject+DYSwizzle.m
//  DYSafeObjectDemo
//
//  Created by defaultyuan on 2018/5/31.
//  Copyright © 2018年 defaultyuan. All rights reserved.
//

#import "NSObject+DYSwizzle.h"

@implementation NSObject (DYSwizzle)

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL {

    Class class = [self class];

    Method originalMethod = class_getInstanceMethod(class, originalSEL);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSEL);

    BOOL didAddMethod =
    class_addMethod(class,
                    originalSEL,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));

    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSEL,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
