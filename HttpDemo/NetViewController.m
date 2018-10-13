//
//  NetViewController.m
//  HttpDemo
//
//  Created by mac on 18/10/13.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "NetViewController.h"
#import "HttpRequest.h"
@interface NetViewController ()
@property(nonatomic,strong) UIButton *button1 ;
@property(nonatomic,strong) UIButton *button2 ;
@end

@implementation NetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, 80, 40)];
    _button1.backgroundColor = [UIColor redColor];
    [_button1 setTitle:@"GET" forState:UIControlStateNormal];
    [_button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_button1];
    
        [_button1 addTarget:self action:@selector(button1Click) forControlEvents:UIControlEventTouchUpInside];
    
    
    _button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 90, 80, 40)];
    _button2.backgroundColor = [UIColor redColor];
    [_button2 setTitle:@"确认框" forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_button2];
        [_button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
}

-(void)button1Click{
    [HttpRequest getWithURLString:@"http://180.76.105.202:7788/response.json" paramters:nil success:^(id responseObject) {
        //NSString *str = responseObject ;
        //NSLog(@"%@",str);
        
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSLog(@"%@",json);
    } failure:^(NSError *error) {
        NSLog(@"get error %@",error);
    }];

}

-(void)button2Click{
    UIImageView *iamgeV = [[UIImageView alloc] init];
    iamgeV.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:iamgeV];
    [[HttpRequest sharedInstance] requestWithURLString:@"http://b.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=abb1ea66bb12c8fcb4a6fecbcc33be7d/4ec2d5628535e5dd3e2b3d9974c6a7efce1b6275.jpg" paramters:nil type:HttpRequestTypeGet success:^(id responseObject) {
        iamgeV.image = [UIImage imageWithData:responseObject];
    } failure:^(NSError *error) {
        NSLog(@"请求错误");
    }];
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
