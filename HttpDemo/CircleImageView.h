//
//  CircleImageView.h
//  HttpDemo
//
//  Created by mac on 18/9/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleImageView : UIView

-(void) loadLocalImage:(NSString *)imageName;
-(void) loadNetImage:(NSString *)imageUrl;
@end
