//
//  ViewController.m
//  Dial
//
//  Created by kai.shang on 16/11/4.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"
#import <CoreTelephony/CTCall.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCallCenter.h>
#include <fcntl.h>
#include <dlfcn.h>

#define CTPATH "/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony"

typedef id(*CTCallDial)(NSString*);
typedef id(*CTCallAnswer)(CTCall*);
typedef id(*CTCallDisConnect)(CTCall*);

id CTTelephonyCenterGetDefault(void);
void CTTelephonyCenterAddObserver(id,id,CFNotificationCallback,NSString*,void*,int);
void CTTelephonyCenterRemoveObserver(id,id,NSString*,void*);
NSString *CTCallCopyAddress(void*, CTCall *);
int CTCallGetStatus(CTCall *);

@interface ViewController ()


@end

@class AppDelegate;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    id ct = CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver(ct, NULL, private_api_callback, NULL, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static void private_api_callback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {

    NSString *notifyname=(__bridge NSString *)name;
    
    if ([notifyname isEqualToString:@"kCTCallStatusChangeNotification"])
    {
        NSDictionary *info = (__bridge NSDictionary*)userInfo;
        
        CTCall *call = (CTCall *)[info objectForKey:@"kCTCall"];
        NSLog(@"call %@", call);
    
        int num = CTCallGetStatus(call);
        NSLog(@"Status %d", num);
        
        if (num ==4) {

            void *framework = dlopen(CTPATH, RTLD_LAZY);
            CTCallAnswer answer= (CTCallAnswer)dlsym(framework, "CTCallAnswer");
            
            if (answer) {
                answer(call);
            }
            dlclose(framework);
            
            sleep(5);
        }
        
    }
}

-(void) hangupCall:(CTCall *)call{
    
    void *framework = dlopen(CTPATH, RTLD_LAZY);
    CTCallDisConnect disconnect =(CTCallDisConnect)dlsym(framework, "CTCallDisconnect");
    if(disconnect!=NULL){
        disconnect(call);
    }
    dlclose(framework);
}

void hangup_call(CTCall *call){
    
    void *framework = dlopen(CTPATH, RTLD_LAZY);
    CTCallDisConnect disconnect =(CTCallDisConnect)dlsym(framework, "CTCallDisconnect");
    if(disconnect){
        disconnect(call);
    }
   
}

void answer_call(CTCall *call){
    
    void *framework = dlopen(CTPATH, RTLD_LAZY);
    CTCallAnswer answer= (CTCallAnswer)dlsym(framework, "CTCallAnswer");
    
    if (answer) {
        answer(call);
    }
    dlclose(framework);
}

-(IBAction)hangup:(id)sender{
    
    
}
-(IBAction)dial:(id)sender{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:10086"]];
}

@end
