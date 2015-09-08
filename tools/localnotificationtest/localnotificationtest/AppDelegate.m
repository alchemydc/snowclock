//
//  AppDelegate.m
//  localnotificationtest
//
//  Created by Ian Gordon on 12/6/13.
//  Copyright (c) 2013 Ian Gordon. All rights reserved.
//

#import "AppDelegate.h"

#import "AlarmTrigger.h"
#import "ResortInfo.h"

@implementation AppDelegate {
    void (^backgroundFetchCompletionHandler)(UIBackgroundFetchResult);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.keyToResort = [NSMutableDictionary dictionary];
    self.keyToTrigger = [NSMutableDictionary dictionary];
    
    [self loadStaticResortData];

    AlarmTrigger *trigger = [[AlarmTrigger alloc] init];
    trigger.key = @"303025";
    trigger.minimumAccumulationInches = @4;
    self.keyToTrigger[trigger.key] = trigger;
    
    
    UILocalNotification *localNotification = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotification) {
        NSLog(@"Launch Notification : %@", localNotification.alertBody);
    }

    NSTimeInterval fetchInterval = UIApplicationBackgroundFetchIntervalMinimum;
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:fetchInterval];
    
    UIBackgroundRefreshStatus refreshStatus = [UIApplication sharedApplication].backgroundRefreshStatus;

    NSLog(@"Refresh %d : %.1f", (int)refreshStatus, fetchInterval);
    
    [self fetchSnoCountryData];  //KM
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    UILocalNotification *localNotification = notification;
    if (localNotification) {
        NSLog(@"%@ alertBody : %@", NSStringFromSelector(_cmd), localNotification.alertBody);
    }
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    backgroundFetchCompletionHandler = [completionHandler copy];
    [self fetchSnoCountryData];
}

- (void)fetchSnoCountryData {
    if (backgroundFetchCompletionHandler) {
        NSLog(@"Already fetching in background");
        
        return;
    }
    
    BOOL noSnowOrSnow;
    NSDate *now = [NSDate date];
    NSTimeInterval timeInterval = [now timeIntervalSince1970];
    NSUInteger seconds = (NSUInteger)timeInterval;
    if (seconds % 2) {
        noSnowOrSnow = YES;
    } else {
        noSnowOrSnow = NO;
    }
    
    NSString *URLString;
    if (noSnowOrSnow) {
        URLString = @"https://dl.dropboxusercontent.com/u/9757446/NoSnow.json";
        NSLog(@"---- no no no no snow");
    } else {
        URLString = @"https://dl.dropboxusercontent.com/u/9757446/Snow.json";
        NSLog(@"++++ SNOW SNOW SNOW");
    }
    
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      NSHTTPURLResponse *HTTPResponse;
                                      if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                          HTTPResponse = (NSHTTPURLResponse *)response;
                                      }
                                      if (HTTPResponse.statusCode == 200 && data && !error) {
                                          // Parse Response
                                          [self parseSnoCountryData:data];
                                          
                                          // Determine whether to set alarm
                                          [self determineAlarmState];
                                          
                                      } else {
                                          if (backgroundFetchCompletionHandler)
                                              backgroundFetchCompletionHandler(UIBackgroundFetchResultFailed);
                                      }
                                  }];
    
    [task resume];
}

- (void)loadStaticResortData {
    NSURL *resortDataURL = [[NSBundle mainBundle] URLForResource:@"us_resorts_basics" withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:resortDataURL];

    NSError *error;
    // NOTE This is slightly different than the returned values
    NSArray *resorts = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    for (NSDictionary *resortDict in resorts) {
        NSString *key = resortDict[@"id"];
        if (key) {
            ResortInfo *resortInfo = self.keyToResort[key];
            if (!resortInfo) {
                // Create and grab 'static' values
                resortInfo = [[ResortInfo alloc] init];
                resortInfo.key = key;
                resortInfo.name = resortDict[@"resortName"];
                resortInfo.updateTimeString = resortDict[@"reportDateTime"];
                
                // you need to know where you are to know where you're going :)
                resortInfo.latitude = resortDict[@"latitude"];
                resortInfo.longitude = resortDict[@"longitude"];
                
                resortInfo.verticalDrop = resortDict[@"verticalDrop"];
                
                NSString *state = resortDict[@"state"];
                NSString *country = resortDict[@"country"];
                if ([state length] && [country length]) {
                    resortInfo.locationString = [NSString stringWithFormat:@"%@, %@", state, country];
                } else if ([state length]) {
                    resortInfo.locationString = state;
                } else if ([country length]) {
                    resortInfo.locationString = country;
                }
                
                self.keyToResort[key] = resortInfo;
            }
            
            NSLog(@"Loaded : %@ (%@) (%@ %@) [%@]", resortInfo.name, resortInfo.locationString, resortInfo.latitude, resortInfo.longitude, resortInfo.verticalDrop);
        }
    }
}

- (void)parseSnoCountryData:(NSData *)data {
    NSError *error;
    NSDictionary *JSONDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSArray *resorts = JSONDict[@"items"];
    for (NSDictionary *resortDict in resorts) {
        NSString *key = resortDict[@"id"];
        if (key) {
            ResortInfo *resortInfo = self.keyToResort[key];
            if (resortInfo) {
                // Create and grab 'static' values
                // Grab changing values
                resortInfo.last24HoursInchesSnowString = resortDict[@"lastSnowFallAmount"];
                NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
                [f setNumberStyle:NSNumberFormatterDecimalStyle];
                NSNumber * myNumber = [f numberFromString:resortInfo.last24HoursInchesSnowString];
                resortInfo.last24HoursInchesSnow = myNumber;
                
                NSLog(@"Updated : %@ - %@ (%@)", resortInfo.name, resortInfo.last24HoursInchesSnowString, resortInfo.last24HoursInchesSnow);
            } else {
                NSLog(@"Unable to find resort for key : %@", key);
            }
        }
    }
}

- (void)determineAlarmState {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    for (AlarmTrigger *trigger in self.keyToTrigger.allValues) {
        ResortInfo *info = self.keyToResort[trigger.key];
        if ([info.last24HoursInchesSnowString length]) {
            if (NSOrderedDescending == [info.last24HoursInchesSnow compare:trigger.minimumAccumulationInches]) {
                NSLog(@"Set Alarm !!!!!!!!!!!");
                UILocalNotification *notification = [[UILocalNotification alloc] init];
                NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:5.0];
                notification.fireDate = fireDate;
                notification.alertAction = @"Turn Off 333";
                notification.alertBody = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulu";
                notification.soundName = @"23secondChime.aif";
                
                [[UIApplication sharedApplication] scheduleLocalNotification:notification];
            } else {
                NSLog(@"Sleep in ..........");
                
                [[UIApplication sharedApplication] cancelAllLocalNotifications];
            }
        }
    }
}

@end
