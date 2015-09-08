//
//  AppDelegate.h
//  localnotificationtest
//
//  Created by Ian Gordon on 12/6/13.
//  Copyright (c) 2013 Ian Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableDictionary *keyToResort;
@property (strong, nonatomic) NSMutableDictionary *keyToTrigger;
@property (strong, nonatomic) UILocalNotification *alarmNotification;

@end
