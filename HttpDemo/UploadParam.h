//
//  UploadParam.h
//  HttpDemo
//
//  Created by mac on 18/10/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadParam : NSObject
@property (nonatomic,strong) NSData *data;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *filename;
@property (nonatomic,copy) NSString *mimeType;
@end
