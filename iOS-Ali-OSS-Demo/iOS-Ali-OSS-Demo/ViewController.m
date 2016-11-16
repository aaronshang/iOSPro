//
//  ViewController.m
//  iOS-Ali-OSS-Demo
//
//  Created by kai.shang on 16/11/15.
//  Copyright © 2016年 SK. All rights reserved.
//

#import "ViewController.h"
#import <AliyunOSSiOS/OSSService.h>

@interface ViewController ()
@property(nonatomic, copy) NSString *bucketName;
@property(nonatomic, copy) NSString *objectKey;
@property(nonatomic, copy) NSString *key1;
@property(nonatomic, copy) NSString *key2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.bucketName = @"sk-ali-cloud";
    self.objectKey = [NSString stringWithFormat:@"iOS-%@", @"123123"];
    self.key1 = @"LTAIrF5dFZa7rOPM";
    self.key2 = @"M1u3zg1bNR17LpKiFDmQmi6VjuUDQk";
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self queryAndUploadFile:@""];
    });

}

-(void) queryAndUploadFile:(NSString*) path{
    
    NSString *endpoint = @"oss-cn-shanghai.aliyuncs.com";
    id<OSSCredentialProvider> credential =
    [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:self.key1 secretKey:self.key2];
    
    OSSClient *client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
    
    //判断文件是否存在
    NSError *error = nil;
    BOOL isExist = [client doesObjectExistInBucket:self.bucketName objectKey:self.objectKey error:&error];
    if (isExist) {
        
        //查询下次上传位置
        OSSHeadObjectRequest * head = [OSSHeadObjectRequest new];
        head.bucketName = self.bucketName;
        head.objectKey = self.objectKey;
        
        OSSTask * headTask = [client headObject:head];
        
        [headTask continueWithBlock:^id(OSSTask *task) {
            if (!task.error) {
                OSSHeadObjectResult * headResult = task.result;
                NSLog(@"all response header: %@", headResult.httpResponseHeaderFields);
                
                if (headResult.httpResponseHeaderFields) {
                    NSInteger position = [headResult.httpResponseHeaderFields[@"x-oss-next-append-position"] integerValue];
                    [self appendFile:path position:position ossClient:client];
                }
            } else {
                NSLog(@"head object error: %@", task.error);
            }
            return nil;
        }];
    }
    else{
        [self appendFile:path position:0 ossClient:client];
    }
}

-(void) appendFile:(NSString*) path position:(NSInteger) position ossClient:(OSSClient*) client{
    
    OSSAppendObjectRequest *append = [OSSAppendObjectRequest new];
    append.appendPosition = position;
    append.bucketName = self.bucketName;
    append.objectKey = self.objectKey;
    
    NSString *str = @"china";
    append.uploadingData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    OSSTask *task = [client appendObject:append];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        
        if (!task.error) {
            NSLog(@"appendFile Success");
        }
        else{
            NSLog(@"append failure %@", task.error);
        }
        return nil;
    }];
    
}

-(void) uploadFile{
    
    NSString *endpoint = @"oss-cn-shanghai.aliyuncs.com";
    id<OSSCredentialProvider> credential =
    [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:@"LTAIrF5dFZa7rOPM"secretKey:@"M1u3zg1bNR17LpKiFDmQmi6VjuUDQk"];
    
    OSSClient *client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
    
    OSSPutObjectRequest *put = [OSSPutObjectRequest new];
    put.bucketName = @"sk-ali-cloud";
    put.objectKey = @"imei-001";
    
    NSString *str = @"china";
    put.uploadingData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend){
        NSLog(@"%lld, %lld, %lld", bytesSent, totalBytesSent, totalBytesExpectedToSend);
    };
    
    OSSTask *putTask = [client putObject:put];
    
    [putTask continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        
        if (!task.error) {
            NSLog(@"success");
        }else{
            NSLog(@"Failure %@", task.error);
        }
        return nil;
    }];
    
    [putTask waitUntilFinished];
}

-(void) appendFile:(NSInteger) positon{
    
    NSString *endpoint = @"oss-cn-shanghai.aliyuncs.com";
    id<OSSCredentialProvider> credential =
    [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:@"LTAIrF5dFZa7rOPM"secretKey:@"M1u3zg1bNR17LpKiFDmQmi6VjuUDQk"];
    
    OSSClient *client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
    
    OSSAppendObjectRequest *append = [OSSAppendObjectRequest new];
    append.bucketName = @"sk-ali-cloud";
    append.objectKey = @"iOS-F431C3BAC9AD123";
    append.appendPosition = positon;
    
    NSString *str = @"\nsk love good";
    append.uploadingData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    OSSTask *task = [client appendObject:append];
    [task continueWithBlock:^id _Nullable(OSSTask * _Nonnull task) {
        
        if (!task.error) {
            NSLog(@"success");
            OSSAppendObjectResult *result = task.result;
            NSString *etag = result.eTag;
            NSLog(@"tag %@", etag);
            long nextPosition = result.xOssNextAppendPosition;
            NSLog(@"Next Postion %ld", nextPosition);
        }
        else{
            NSLog(@"append failure %@", task.error);
        }
        return nil;
    }];
    
}

-(void) query{
    
    NSString *endpoint = @"oss-cn-shanghai.aliyuncs.com";
    id<OSSCredentialProvider> credential =
    [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:@"LTAIrF5dFZa7rOPM"secretKey:@"M1u3zg1bNR17LpKiFDmQmi6VjuUDQk"];
    NSString *bucketName = @"sk-ali-cloud";
    NSString *objectKey = @"iOS-F431C3BAC9AD123";
    
    OSSClient *client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
    
    //判断文件是否存在
    NSError *error = nil;
    BOOL isExist = [client doesObjectExistInBucket:bucketName objectKey:objectKey error:&error];
    if (isExist) {
        
        //查询下次上传位置
        OSSHeadObjectRequest * head = [OSSHeadObjectRequest new];
        head.bucketName = bucketName;
        head.objectKey = objectKey;
        
        OSSTask * headTask = [client headObject:head];
        
        [headTask continueWithBlock:^id(OSSTask *task) {
            if (!task.error) {
                OSSHeadObjectResult * headResult = task.result;
                NSLog(@"all response header: %@", headResult.httpResponseHeaderFields);
                
                if (headResult.httpResponseHeaderFields) {
                    NSInteger position = [headResult.httpResponseHeaderFields[@"x-oss-next-append-position"] integerValue];
                    [self appendFile:position];
                }
            } else {
                NSLog(@"head object error: %@", task.error);
            }
            return nil;
        }];

    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
