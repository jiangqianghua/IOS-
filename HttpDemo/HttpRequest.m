//
//  HttpRequest.m
//  HttpDemo
//
//  Created by mac on 18/10/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "HttpRequest.h"

#import "AFNetworking.h"
#import "UploadParam.h"

@implementation HttpRequest

static id _instance = nil ;
+(instancetype)sharedInstance{
    return [[self alloc] init];
}

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t once_Token;
    dispatch_once(&once_Token,^{
        _instance = [super allocWithZone:zone];
    });
    return _instance ;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
        AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
        [manager startMonitoring];
        [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {
                case AFNetworkReachabilityStatusUnknown:
                {
                    // 位置网络
                    NSLog(@"位置网络");
                }
                    break;
                case AFNetworkReachabilityStatusNotReachable:
                {
                    // 无法联网
                    NSLog(@"无法联网");
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                {
                    // 手机自带网络
                    NSLog(@"当前使用的是2G/3G/4G网络");
                }
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                {
                    // WIFI
                    NSLog(@"当前在WIFI网络下");
                }
            }
        }];
    });
    return _instance;
}

+(void)getWithURLString:(NSString *)URLString
              paramters:(id)paramters
                success:(void(^)(id responseObject))success
                failure:(void(^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = 30 ;
    
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

+(void)postWithURLString:(NSString *)URLString
               paramters:(id)paramters
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSError *error))failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URLString parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

-(void)requestWithURLString:(NSString *)URLString
                  paramters:(id)paramters
                       type:(HttpRequestType) type
                    success:(void(^)(id responseObject))success
                    failure:(void(^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    switch (type) {
        case HttpRequestTypeGet:
        {
            [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
        case HttpRequestTypePost:
        {
            [manager POST:URLString parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
                    failure(error);
                }
            }];
        }
            break;
    }

}

+(void)uploadWithURLString:(NSString *)URLString
                 paramters:(id)paramters
               uploadParam:(NSArray <UploadParam *> *)uploadParams
                   success:(void(^)())success
                   failure:(void(^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:URLString parameters:paramters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (UploadParam *uploadParam in uploadParams) {
            [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.filename mimeType:uploadParam.mimeType];
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+(void)downLoadWidthURLString:(NSString *)URLString
                    paramters:(id)paramters
                     progress:(void(^)())progress
                      success:(void(^)())success
                      failure:(void(^)(NSError *error)) failure{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    NSURLSessionDownloadTask *downLoadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress();
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return targetPath;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (failure) {
            failure(error);
        }
    }];
    [downLoadTask resume];
}
@end
