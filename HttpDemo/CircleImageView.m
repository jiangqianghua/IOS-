//
//  CircleImageView.m
//  HttpDemo
//
//  Created by mac on 18/9/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "CircleImageView.h"
@interface CircleImageView()

@property (nonatomic,strong) UIImageView * imageView ;

@end
@implementation CircleImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _imageView.layer.cornerRadius = frame.size.width * 0.5;
        _imageView.layer.masksToBounds = YES ;
        [self addSubview:_imageView];
    }
    return self;
}
-(void)loadLocalImage:(NSString *)imageName{
    _imageView.image = [UIImage imageNamed:imageName];
   // [_imageView sizeToFit];
}

-(void)loadNetImage:(NSString *)imageUrl{
    NSURL *imgURL = [NSURL URLWithString:imageUrl];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imgURL]];
    _imageView.image = image;
    //[_imageView sizeToFit];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
