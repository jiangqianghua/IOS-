//
//  HttpRequest.h
//  HttpDemo
//
//  Created by mac on 18/10/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UploadParam;

typedef NS_ENUM(NSUInteger,HttpRequestType)
{
    HttpRequestTypeGet = 0 ,
    HttpRequestTypePost
};


@interface HttpRequest : NSObject
+(instancetype)sharedInstance ;

+(void)getWithURLString:(NSString *)URLString
                 paramters:(id)paramters
                 success:(void(^)(id responseObject))success
                 failure:(void(^)(NSError *error))failure ;

+(void)postWithURLString:(NSString *)URLString
              paramters:(id)paramters
                success:(void(^)(id responseObject))success
                failure:(void(^)(NSError *error))failure ;

-(void)requestWithURLString:(NSString *)URLString
                  paramters:(id)paramters
                       type:(HttpRequestType) type
                    success:(void(^)(id responseObject))success
                    failure:(void(^)(NSError *error))failure;

+(void)uploadWithURLString:(NSString *)URLString
                 paramters:(id)paramters
               uploadParam:(NSArray <UploadParam *> *)uploadParams
                   success:(void(^)())success
                   failure:(void(^)(NSError *error))failure;

+(void)downLoadWidthURLString:(NSString *)URLString
                    paramters:(id)paramters
                     progress:(void(^)())progress
                      success:(void(^)())success
                      failure:(void(^)(NSError *error)) failure;

@end
