//
//  DPUserDefaults.m
//  DPUserDefaults
//
//  Created by Kostas on 15/1/15.
//  Copyright (c) 2015 Kostas Antonopoulos. All rights reserved.
//

#import "DPUserDefaults.h"

@interface DPUserDefaults (){
    NSString *_userId;
}

@end

@implementation DPUserDefaults

static DPUserDefaults *shared;

+(DPUserDefaults*)standardUserDefaults{
    if (!shared) {
        shared = [[DPUserDefaults alloc]init];
    }
    return shared;
}

#pragma mark - User Methods

-(void)setUserId:(NSString*)userId{
    _userId = userId;
}

-(NSString*)currentUserId{
    return _userId;
}

-(NSString*)userKeyForKey:(NSString*)key{
    NSAssert(_userId, @"UserId cant be nil");
    return [NSString stringWithFormat:@"DPUserDefaults-%@-%@",_userId,key];
}

#pragma mark - Object

- (id)objectForKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults]objectForKey:[self userKeyForKey:key]];
}

- (void)setObject:(id)value forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:[self userKeyForKey:key]];
}

- (void)removeObjectForKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:[self userKeyForKey:key]];
}

#pragma mark - Bool

- (void)setBool:(BOOL)value forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults]setBool:value forKey:[self userKeyForKey:key]];
}

- (BOOL)boolForKey:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults]boolForKey:[self userKeyForKey:key]];
}

#pragma mark - Synchronize

- (BOOL)synchronize{
    return [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
