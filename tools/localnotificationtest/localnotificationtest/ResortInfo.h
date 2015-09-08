//
//  ResortInfo.h
//  localnotificationtest
//
//  Created by Ian Gordon on 12/6/13.
//  Copyright (c) 2013 Ian Gordon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResortInfo : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *last24HoursInchesSnow;
@property (nonatomic, copy) NSString *last24HoursInchesSnowString;
//@property (nonatomic, copy) NSDate *updateTime;
@property (nonatomic, copy) NSString *updateTimeString;
@property (nonatomic, copy) NSString *locationString;

// this doesn't work
//@property (nonatomic, copy) CLLocationDegrees *latitude;
//@property (nonatomic, copy) CLLocationDegrees *longitude;

// this doesn't work either
//@property (nonatomic, copy) NSDecimal *latitude;
//@property (nonatomic, copy) NSDecimal *longitude;

// this works but lat/long really shouldn't be strings
@property (nonatomic, copy) NSString *latitude;
@property (nonatomic, copy) NSString *longitude;

// size does matter bitches
@property (nonatomic, copy) NSNumber *verticalDrop;



@end
