//
//  LayoutViewController.m
//  HttpDemo
//
//  Created by mac on 18/10/11.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "LayoutViewController.h"
#import "MyLayout.h"

@interface LayoutViewController ()
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UITextField *textfield;
@end

@implementation LayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // mylayout
    // 线性布局
    MyLinearLayout *S = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
    S.subviewMargin = 0;
    S.myWidth = 200;
    S.backgroundColor = [UIColor greenColor];
    
    UIView *A = [[UIView alloc] init];
    A.myLeftMargin = A.myRightMargin = 5;
    A.myHeight = 40;
    A.backgroundColor = [UIColor blueColor];
    [S addSubview:A];
    
    UIView *B = [[UIView alloc] init];
    B.leftPos.equalTo(@60);
    B.rightPos.equalTo(@40);
    B.heightDime.equalTo(@40);
    B.backgroundColor = [UIColor redColor];
    [S addSubview:B];
    
    [self.view addSubview:S];
    
    // 相对布局
    MyRelativeLayout *R = [[MyRelativeLayout alloc] init];
    R.myWidth = 170;
    R.myHeight = 280;
    R.myTopMargin = 100 ;
    [self.view addSubview:R];
    R.backgroundColor = [UIColor grayColor];
    
    UIView *A1 = [[UIView alloc] init];
    A1.leftPos.equalTo(@20);
    A1.topPos.equalTo(@20);
    A1.widthDime.equalTo(@40);
    A1.heightDime.equalTo(A1.widthDime);
    [R addSubview:A1];
    A1.backgroundColor = [UIColor yellowColor];
    
    UIView *B1 = [[UIView alloc] init];
    //B1.leftPos.equalTo(A1.centerXPos);
    B1.leftPos.equalTo(A1.rightPos).offset(20);
    B1.topPos.equalTo(A1.bottomPos).offset(10);
    B1.widthDime.equalTo(@60);
    B1.heightDime.equalTo(A1.heightDime);
    [R addSubview:B1];
    B1.backgroundColor = [UIColor redColor];
    
    UIView *C1 = [[UIView alloc] init];
    //B1.leftPos.equalTo(A1.centerXPos);
    C1.leftPos.equalTo(A1.rightPos).offset(20);
    C1.bottomPos.equalTo(B1.topPos).offset(10);
    C1.widthDime.equalTo(@30);
    C1.heightDime.equalTo(A1.heightDime);
    [R addSubview:C1];
    C1.backgroundColor = [UIColor blueColor];
    
    UIView *E1 = [UIView new];
    E1.centerYPos.equalTo(@0);
    E1.centerXPos.equalTo(@0);
    E1.heightDime.equalTo(@40);
    E1.widthDime.equalTo(R.widthDime).add(-20);
    E1.backgroundColor = [UIColor blackColor];
    [R addSubview:E1];
    
    [self.view addSubview:R];

    
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
