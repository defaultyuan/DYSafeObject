//
//  NSDictionary+DYSafe.m
//  DYSafeObjectDemo
//
//  Created by defaultyuan on 2018/5/31.
//  Copyright © 2018年 defaultyuan. All rights reserved.
//

#import "NSDictionary+DYSafe.h"
#import "NSObject+DYSwizzle.h"

@implementation NSDictionary (DYSafe)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [object_getClass((id)self) swizzleSEL:@selector(dictionaryWithObjects:forKeys:count:) withSEL:@selector(dy_dictionaryWithObjects:forKeys:count:)];

        [objc_getClass("__NSPlaceholderDictionary") swizzleSEL:@selector(initWithObjects:forKeys:count:) withSEL:@selector(dy_initWithObjects:forKeys:count:)];
        
    });

}

+ (instancetype)dy_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt
{
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            continue;
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }

    return [self dy_dictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

- (instancetype)dy_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            continue;
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self dy_initWithObjects:safeObjects forKeys:safeKeys count:j];
}

@end
