//
//  Helpers.m
//  FHelpers
//
//  Created by Frederic Delbos on 10/15/12.
//  Copyright (c) 2012 Frederic Delbos. All rights reserved.
//

#import "Helpers.h"
#import "SFHFKeychainUtils.h"
#import "AppDelegate.h"
#import <objc/runtime.h>
#import "MBProgressHUD.h"

#define FHELPER_SERVICE @"FHelperService"

@implementation Helpers

+(void)setProperty:(NSString*)propertyName value:(NSString*)value
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:value forKey:propertyName];
    [prefs synchronize];
}

+(NSString*)getProperty:(NSString*)propertyName
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs stringForKey:name];
}


+(BOOL)setEncryptedProperty:(NSString*)propertyName value:(NSString)value;
{
    NSError *error = nil;
    if (![SFHFKeychainUtils storeUsername:propertyName
                              andPassword:value
                           forServiceName:FHELPER_SERVICE
                           updateExisting:TRUE error:&error])
        return FALSE;
    return TRUE;
}

+(NSString*)getEncryptedProperty:(NSString*)propertyName;
{
    return [SFHFKeychainUtils getPasswordForUsername:propertyName
                                      andServiceName:FHELPER_SERVICE
                                               error:nil];
}


+(void)alertMsg:(NSString*)msg title:(NSString*)title
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: title
                          message: msg
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

+(NSString*)formatDate:(NSDate*)date
{
    return [NSDateFormatter localizedStringFromDate:date
                                          dateStyle:NSDateFormatterShortStyle
                                          timeStyle:NSDateFormatterShortStyle];
}

+(NSString*)className:(Class)classType
{
    return [NSString stringWithCString:class_getName(classType) encoding:NSASCIIStringEncoding];
}

+(void)runMainQueue:(queueBlock)block
{
    if ([NSThread isMainThread])
        block();
    else
        dispatch_sync(dispatch_get_main_queue(), block);
}

+(void)runAsync:(queueBlock)block
{
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

+(NSURL*)wwwURL:(NSString*)www
{
    return [NSURL URLWithString:www];
}

+(NSURL*)emailURL:(NSString*)email
{
    NSString *str = [NSString stringWithFormat:@"mailto:?to=%@", [email stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    return [NSURL URLWithString:str];
}

+(NSURL*)phoneURL:(NSString*)number
{
    NSString *str = [NSString stringWithFormat:@"tel://%@", number];
    return [NSURL URLWithString:str];
}

+(NSURL*)mapURL:(NSString*)address
{
    NSString* versionNum = [[UIDevice currentDevice] systemVersion];
    NSString *nativeMapScheme = @"maps.apple.com";
    if ([versionNum compare:@"6.0" options:NSNumericSearch] == NSOrderedAscending)
        nativeMapScheme = @"maps.google.com";

    NSString* url = [NSString stringWithFormat: @"http://%@/maps?q=%@", nativeMapScheme,
                     [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    return [NSURL URLWithString:url];
}

@end

