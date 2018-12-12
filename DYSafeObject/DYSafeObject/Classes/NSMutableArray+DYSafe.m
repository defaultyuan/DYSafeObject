//
//  NSMutableArray+DYSafe.m
//  DYSafeObjectDemo
//
//  Created by defaultyuan on 2018/5/31.
//  Copyright © 2018年 defaultyuan. All rights reserved.
//

#import "NSMutableArray+DYSafe.h"
#import "NSObject+DYSwizzle.h"

@implementation NSMutableArray (DYSafe)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [objc_getClass("__NSArrayM") swizzleSEL:@selector(objectAtIndex:) withSEL:@selector(dy_objectAtIndex:)];

        [objc_getClass("__NSArrayM") swizzleSEL:@selector(removeObjectsInRange:) withSEL:@selector(dy_removeObjectsInRange:)];

        [objc_getClass("__NSArrayM") swizzleSEL:@selector(insertObject:atIndex:) withSEL:@selector(dy_insertObject:atIndex:)];

        [objc_getClass("__NSArrayM") swizzleSEL:@selector(removeObject:inRange:) withSEL:@selector(dy_removeObject:inRange:)];

        [objc_getClass("__NSArrayM") swizzleSEL:@selector(objectAtIndexedSubscript:) withSEL:@selector(dy_objectAtIndexedSubscript:)];

        [objc_getClass("__NSArrayM") swizzleSEL:@selector(addObject:) withSEL:@selector(dy_addObject:)];


        [objc_getClass("__NSArrayM") swizzleSEL:@selector(replaceObjectAtIndex:withObject:) withSEL:@selector(dy_replaceObjectAtIndex:withObject:)];


    });
}



- (id)dy_objectAtIndex:(NSUInteger)index
{
    @autoreleasepool {
        if (index >= self.count) {
            return nil;
        }
        return [self dy_objectAtIndex:index];
    }
}

- (id)dy_objectAtIndexedSubscript:(NSUInteger)index {
    @autoreleasepool {
        if (index >= self.count){
            return nil;
        }
        return [self dy_objectAtIndexedSubscript:index];
    }
}

- (void)dy_addObject:(id)object
{
    @autoreleasepool {
        if (!object) {

        } else {
            [self dy_addObject:object];
        }
    }
}

- (void)dy_removeObjectAtIndex:(NSInteger)index
{
    @autoreleasepool {
        if (index >= self.count) {
            return;
        }

        [self dy_removeObjectAtIndex:index];
    }
}

- (void)dy_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    @autoreleasepool {
        if (!anObject) {
            return;
        }
        [self dy_insertObject:anObject atIndex:index];
    }
}

- (void)dy_removeObject:(id)anObject inRange:(NSRange)range {
    @autoreleasepool {
        if (range.location > self.count) {
            return;
        }

        if (range.length > self.count) {
            return;
        }

        if ((range.location + range.length) > self.count) {
            return;
        }

        if (!anObject){
            return;
        }


        return [self dy_removeObject:anObject inRange:range];
    }
}

- (void)dy_removeObjectsInRange:(NSRange)range {
    @autoreleasepool {
        if (range.location > self.count) {
            return;
        }

        if (range.length > self.count) {
            return;
        }

        if ((range.location + range.length) > self.count) {
            return;
        }

        return [self dy_removeObjectsInRange:range];
    }
}


- (void)dy_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    @autoreleasepool {
        if (index >= self.count) {
            return;
        }
        if (!anObject) {
            return;
        }
        [self dy_replaceObjectAtIndex:index withObject:anObject];
    }
}

@end
