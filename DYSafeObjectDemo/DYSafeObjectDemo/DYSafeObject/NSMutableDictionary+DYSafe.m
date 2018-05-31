//
//  NSMutableDictionary+DYSafe.m
//  DYSafeObjectDemo
//
//  Created by defaultyuan on 2018/5/31.
//  Copyright © 2018年 defaultyuan. All rights reserved.
//

#import "NSMutableDictionary+DYSafe.h"
#import "NSObject+DYSwizzle.h"

@implementation NSMutableDictionary (DYSafe)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [objc_getClass("__NSDictionaryM") swizzleSEL:@selector(setObject:forKey:) withSEL:@selector(dy_setObject:forKey:)];

        [objc_getClass("__NSDictionaryM") swizzleSEL:@selector(setValue:forKey:) withSEL:@selector(dy_setValue:forKey:)];

        [objc_getClass("__NSDictionaryM") swizzleSEL:@selector(removeObjectForKey:) withSEL:@selector(dy_removeObjectForKey:)];
        
        [objc_getClass("__NSDictionaryM") swizzleSEL:@selector(setObject:forKeyedSubscript:) withSEL:@selector(dy_setObject:forKeyedSubscript:)];

    });

}

- (void)dy_setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (!anObject)
    {
        return;
    }
    if (!aKey)
    {
        return;
    }
    [self dy_setObject:anObject forKey:aKey];
}

- (void)dy_setValue:(id)value forKey:(NSString *)key
{
    if (!key)
    {
        return;
    }
    [self dy_setValue:value forKey:key];
}


- (void)dy_removeObjectForKey:(id)aKey
{
    if (!aKey)
    {
        return;
    }
    [self dy_removeObjectForKey:aKey];
}

- (void)dy_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (!obj)
    {
        return;
    }
    if (!key)
    {
        return;
    }
    [self dy_setObject:obj forKeyedSubscript:key];
}
@end
