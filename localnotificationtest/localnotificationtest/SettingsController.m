//
//  SettingsController.m
//  localnotificationtest
//
//  Created by Ian Gordon on 12/7/13.
//  Copyright (c) 2013 Ian Gordon. All rights reserved.
//

#import "SettingsController.h"

@interface SettingsController ()

@end

@implementation SettingsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setupNotification1:(id)sender {
    NSLog(@"111");
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:1.0];
    notification.fireDate = fireDate;
    notification.alertBody = @"Test 111";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

- (IBAction)setupNotification2:(id)sender {
    NSLog(@"222");
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:3.0];
    notification.fireDate = fireDate;
    notification.alertAction = @"Turn Off 222";
    notification.alertBody = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulu";
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (IBAction)setupNotification3:(id)sender {
    NSLog(@"333");
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:5.0];
    notification.fireDate = fireDate;
    notification.alertAction = @"Turn Off 333";
    notification.alertBody = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulu";
    notification.soundName = @"23secondChime.aif";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
