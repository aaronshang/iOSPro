//
//  ViewController.m
//  iOS-BackgroundRun
//
//  Created by kai.shang on 16/11/17.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property(nonatomic, strong) CLLocationManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     UIBackgroundTaskIdentifier taskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:taskId];
    }];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        for (int i=0; i<30; i++) {
            
            if (YES) {
                sleep(1);
                NSLog(@"count %d", i);
            }
        }
    });
    
    _manager = [[CLLocationManager alloc] init];
    _manager.delegate = self;
    [_manager requestAlwaysAuthorization];
    [_manager requestWhenInUseAuthorization];
    [_manager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    
    NSLog(@"new location %@", newLocation);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
