//
//  DPUserDefaults.h
//  DPUserDefaults
//
//  Created by Kostas on 15/1/15.
//  Copyright (c) 2015 Kostas Antonopoulos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPUserDefaults : NSObject

+(DPUserDefaults*)standardUserDefaults;

-(NSString*)currentUserId;


- (id)objectForKey:(NSString *)key;
- (void)setObject:(id)value forKey:(NSString *)key;
- (void)removeObjectForKey:(NSString *)key;

- (void)setBool:(BOOL)value forKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;

- (BOOL)synchronize;

@end
