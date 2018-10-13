//
//  KeyValueView.m
//  HttpDemo
//
//  Created by mac on 18/9/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "KeyValueView.h"

@implementation KeyValueView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)/3, CGRectGetHeight(self.frame))];
        _keyLabel.backgroundColor = [UIColor clearColor];
        _keyLabel.textAlignment = NSTextAlignmentLeft;
        _keyLabel.font = [UIFont systemFontOfSize:16];
        _keyLabel.textColor = [UIColor blackColor];
        [self addSubview:_keyLabel];
        
        _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/3, 0,  2*CGRectGetWidth(self.frame)/3,CGRectGetHeight(self.frame))];
        _valueLabel.backgroundColor = [UIColor clearColor];
        _valueLabel.textAlignment = NSTextAlignmentLeft;
        _valueLabel.font = [UIFont systemFontOfSize:16];
        _valueLabel.textColor = [UIColor blackColor];
        
        _valueTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame)/3, 0,  2*CGRectGetWidth(self.frame)/3,CGRectGetHeight(self.frame))];
        _valueTextField.backgroundColor = [UIColor clearColor];
        _valueTextField.textAlignment = NSTextAlignmentLeft;
        _valueTextField.font = [UIFont systemFontOfSize:16];
        _valueTextField.textColor = [UIColor blackColor];
        [_valueTextField setHidden:YES];
        
        
        [self addSubview:_valueLabel];
        [self addSubview:_valueTextField];
        
        
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)];
        // 2. 将点击事件添加到label上
        [_valueLabel addGestureRecognizer:labelTapGestureRecognizer];
        _valueLabel.userInteractionEnabled = YES; // 可以理解为设置label可被点击
    }
    return self;
}

-(void)setupKey:(NSString *)key value:(NSString *)value{
    [_keyLabel setText:key];
    [_valueLabel setText:value];
    [_valueTextField setText:value];
}

- (void)labelClick {
    [_valueLabel setHidden:YES];
    [_valueTextField setHidden:FALSE];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
