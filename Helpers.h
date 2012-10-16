//
//  Helpers.h
//  FHelpers
//
//  Created by Frederic Delbos on 10/15/12.
//  Copyright (c) 2012 Frederic Delbos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomeTable.h"

// application typedefs
typedef void(^queueBlock)();
typedef void(^queueBlockResult)(id result);

// To make any class a shared instance
// For example :
//+ (id)sharedInstance
//{
//    DEFINE_SHARED_INSTANCE_USING_BLOCK(^{
//        return [[self alloc] init];
//    });
//}
#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block)       \
    static dispatch_once_t pred = 0;                    \
    __strong static id _sharedObject = nil;             \
    dispatch_once(&pred, ^{                             \
        _sharedObject = block();                        \
    });                                                 \
    return _sharedObject;                               \

// UIColor shortcuts
#define RGB(r, g, b)        \
    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a)    \
    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


// basic system helpers
@interface Helpers : NSObject

+(BOOL)setEncryptedProperty:(NSString*)propertyName value:(NSString)value;
+(NSString*)getEncryptedProperty:(NSString*)propertyName;
+(void)setProperty:(NSString*)propertyName value:(NSString*)value;
+(NSString*)getProperty:(NSString*)propertyName;

+(void)alertMsg:(NSString*)msg title:(NSString*)title;

+(NSString*)formatDate:(NSDate*)date;
+(NSString*)className:(Class)classType;
+(void)runMainQueue:(queueBlock)block;
+(void)runAsync:(queueBlock)block;

+(NSURL*)wwwURL:(NSString*)www;
+(NSURL*)emailURL:(NSString*)email;
+(NSURL*)phoneURL:(NSString*)number;
+(NSURL*)mapURL:(NSString*)address;

@end

