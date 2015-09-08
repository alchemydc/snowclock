//
//  AlarmController.m
//  localnotificationtest
//
//  Created by Ian Gordon on 12/7/13.
//  Copyright (c) 2013 Ian Gordon. All rights reserved.
//

#import "AlarmController.h"

@interface AlarmController ()

@end

@implementation AlarmController

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
    
    self.view.backgroundColor = [UIColor redColor]; // KM
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
