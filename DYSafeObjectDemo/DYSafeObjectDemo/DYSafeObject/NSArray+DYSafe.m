//
//  NSArray+DYSafe.m
//  DYSafeObjectDemo
//
//  Created by defaultyuan on 2018/5/31.
//  Copyright © 2018年 defaultyuan. All rights reserved.
//

#import "NSArray+DYSafe.h"
#import "NSObject+DYSwizzle.h"

@implementation NSArray (DYSafe)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [objc_getClass("__NSArray0") swizzleSEL:@selector(objectAtIndex:) withSEL:@selector(dy_empty_objectAtIndex:)];

        [objc_getClass("__NSArrayI") swizzleSEL:@selector(objectAtIndex:) withSEL:@selector(dy_objectAtIndex:)];

        [objc_getClass("__NSSingleObjectArrayI") swizzleSEL:@selector(objectAtIndex:) withSEL:@selector(dy_singleObjectAtIndex:)];

        [objc_getClass("__NSArrayI") swizzleSEL:@selector(objectAtIndexedSubscript:) withSEL:@selector(dy_objectAtIndexedSubscript:)];

        [objc_getClass("__NSPlaceholderArray") swizzleSEL:@selector(initWithObjects:count:) withSEL:@selector(dy_initWithObjects:count:)];
        
        [object_getClass((id)self) swizzleSEL:@selector(arrayWithObjects:count:) withSEL:@selector(dy_arrayWithObjects:count:)];

    });

}

- (instancetype)dy_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt
{
    id safeObjects[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id obj = objects[i];

        if (!obj) {
            continue;
        }
        safeObjects[j] = obj;
        j++;
    }
    return [self dy_initWithObjects:safeObjects count:j];
}

+ (instancetype)dy_arrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {

    id safeObjects[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id obj = objects[i];

        if (!obj) {
            continue;
        }
        safeObjects[j] = obj;
        j++;
    }

    return [self dy_arrayWithObjects:safeObjects count:j];
}

- (id)dy_empty_objectAtIndex:(NSUInteger)index {

    if (index >= self.count){
        return nil;
    }
    return [self dy_empty_objectAtIndex:index];
}

- (id)dy_objectAtIndex:(NSUInteger)index {

    if (index >= self.count) {
        return nil;
    }
    return [self dy_objectAtIndex:index];

}

- (id)dy_singleObjectAtIndex:(NSUInteger)index {

    if (index >= self.count){
        return nil;
    }
    return [self dy_singleObjectAtIndex:index];
}

- (id)dy_objectAtIndexedSubscript:(NSUInteger)index {
    if (index >= self.count){
        return nil;
    }
    return [self dy_objectAtIndexedSubscript:index];
}

@end
