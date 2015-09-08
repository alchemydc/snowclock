//
//  ViewController.m
//  localnotificationtest
//
//  Created by Ian Gordon on 12/6/13.
//  Copyright (c) 2013 Ian Gordon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *button;
    CGRect frame = CGRectMake(12.0, 44.0, 220.0, 44.0);
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button = button1;
    [button addTarget:self action:@selector(setupNotification1:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:button];
    button.frame = frame;
    
    frame.origin.y += frame.size.height + 12.0;
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button = button2;
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(setupNotification2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.frame = frame;
    
    frame.origin.y += frame.size.height + 12.0;
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button = button3;
    button.backgroundColor = [UIColor lightGrayColor];
    [button addTarget:self action:@selector(setupNotification3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.frame = frame;
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
