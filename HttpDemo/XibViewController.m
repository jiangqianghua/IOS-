//
//  XibViewController.m
//  HttpDemo
//
//  Created by mac on 18/10/17.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "XibViewController.h"
#import "XibView.h"

@interface XibViewController ()
@property(nonatomic,strong) XibView *xibView ;
@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    _label = [UILabel alloc] init］;
//    _label.text
    
    _XibLabel.text = @"xib test";
    
    //_xibView = [[XibView alloc] initWithFrame:CGRectMake(0,0, 400, 400)];
    NSArray *objs = [[NSBundle mainBundle]loadNibNamed:@"XibView1" owner:nil options:nil];
    _xibView = objs.firstObject;
   // _xibView.backgroundColor= [UIColor redColor];
    [_xibView setBackgroundColor:[UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:0.0]];
   // _xibView.xibMyLabel.text = @"hua";
    [self.view addSubview: _xibView];
}
- (IBAction)xibBtnClick:(id)sender {
    NSLog(@"xib btn click ...");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
