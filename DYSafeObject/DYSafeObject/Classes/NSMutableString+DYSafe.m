//
//  NSMutableString+DYSafe.m
//  DYSafeObjectDemo
//
//  Created by defaultyuan on 2018/5/31.
//  Copyright © 2018年 defaultyuan. All rights reserved.
//

#import "NSMutableString+DYSafe.h"
#import "NSObject+DYSwizzle.h"

@implementation NSMutableString (DYSafe)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSCFString") swizzleSEL:@selector(substringFromIndex:) withSEL:@selector(dy_substringFromIndex:)];

        [objc_getClass("__NSCFString") swizzleSEL:@selector(substringToIndex:) withSEL:@selector(dy_substringToIndex:)];

        [objc_getClass("__NSCFString") swizzleSEL:@selector(substringWithRange:) withSEL:@selector(dy_substringWithRange:)];

        [objc_getClass("__NSCFString") swizzleSEL:@selector(rangeOfString:options:range:locale:) withSEL:@selector(dy_rangeOfString:options:range:locale:)];

        [objc_getClass("__NSCFString") swizzleSEL:@selector(appendString:) withSEL:@selector(dy_appendString:)];

    });

}

- (NSString *)dy_substringFromIndex:(NSUInteger)from {

    if (from > self.length ) {
        return nil;
    }
    return [self dy_substringFromIndex:from];
}

- (NSString *)dy_substringToIndex:(NSUInteger)to {
    if (to > self.length ) {
        return nil;
    }
    return [self dy_substringToIndex:to];
}

- (NSString *)dy_substringWithRange:(NSRange)range {
    if (range.location > self.length) {
        return nil;
    }

    if (range.length > self.length) {
        return nil;
    }

    if ((range.location + range.length) > self.length) {
        return nil;
    }
    return [self dy_substringWithRange:range];
}


- (NSRange)dy_rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(nullable NSLocale *)locale {
    if (!searchString) {
        searchString = self;
    }

    if (rangeOfReceiverToSearch.location > self.length) {
        rangeOfReceiverToSearch = NSMakeRange(0, self.length);
    }

    if (rangeOfReceiverToSearch.length > self.length) {
        rangeOfReceiverToSearch = NSMakeRange(0, self.length);
    }

    if ((rangeOfReceiverToSearch.location + rangeOfReceiverToSearch.length) > self.length) {
        rangeOfReceiverToSearch = NSMakeRange(0, self.length);
    }


    return [self dy_rangeOfString:searchString options:mask range:rangeOfReceiverToSearch locale:locale];
}

- (void)dy_appendString:(NSString *)aString {
    if (!aString) {
        return;
    }
    return [self dy_appendString:aString];
}

@end
