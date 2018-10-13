//
//  KeyValueView.h
//  HttpDemo
//
//  Created by mac on 18/9/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyValueView : UIView
@property(nonatomic,strong) UILabel* keyLabel;
@property(nonatomic,strong) UILabel* valueLabel ;
@property(nonatomic,strong) UITextField* valueTextField ;


-(void)setupKey:(NSString *)key value:(NSString *)value;
@end
