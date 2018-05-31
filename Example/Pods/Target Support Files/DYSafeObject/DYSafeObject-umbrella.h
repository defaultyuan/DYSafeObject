#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSArray+DYSafe.h"
#import "NSDictionary+DYSafe.h"
#import "NSMutableArray+DYSafe.h"
#import "NSMutableDictionary+DYSafe.h"
#import "NSMutableString+DYSafe.h"
#import "NSObject+DYSafe.h"
#import "NSObject+DYSwizzle.h"

FOUNDATION_EXPORT double DYSafeObjectVersionNumber;
FOUNDATION_EXPORT const unsigned char DYSafeObjectVersionString[];

