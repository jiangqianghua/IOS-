//
//  DialogViewController.m
//  HttpDemo
//
//  Created by mac on 18/10/12.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "DialogViewController.h"

@interface DialogViewController ()
@property(nonatomic,strong) UIButton *button1 ;
@property(nonatomic,strong) UIButton *button2 ;

@property (strong, nonatomic) UIAlertAction *okAction;
@property (strong, nonatomic) UIAlertAction *cancelAction;
@end

@implementation DialogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, 80, 40)];
    _button1.backgroundColor = [UIColor redColor];
    [_button1 setTitle:@"提示" forState:UIControlStateNormal];
    [_button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_button1];
    
    _button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 90, 80, 40)];
    _button2.backgroundColor = [UIColor redColor];
    [_button2 setTitle:@"确认框" forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_button2];
    
    
    [_button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    [_button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)button1Click{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"这是提示的详细信息" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}

-(void)button2Click{
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认注销吗？" preferredStyle:UIAlertControllerStyleAlert];
    // 确定注销
    _okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
        // 1.清除用户名、密码的存储
        
        // 2.跳转到登录界面
       // [self performSegueWithIdentifier:@"Logout" sender:nil];
    }];
    _cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:_okAction];
    [alert addAction:_cancelAction];
    
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
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
