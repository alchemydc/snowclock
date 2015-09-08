//
//  AlarmTrigger.h
//  localnotificationtest
//
//  Created by Ian Gordon on 12/7/13.
//  Copyright (c) 2013 Ian Gordon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlarmTrigger : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSNumber *minimumAccumulationInches;
@property (nonatomic, assign) BOOL active;

@end
