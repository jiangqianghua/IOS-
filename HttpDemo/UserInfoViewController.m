//
//  UserInfoViewController.m
//  HttpDemo
//
//  Created by mac on 18/9/25.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UserInfoViewController.h"
#import "KeyValueView.h"
#import "WebViewController.h"
#import "AppDelegate.h"
#import "CircleImageView.h"
#import "DataBaseHandle.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width ;
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height;

@interface UserInfoViewController ()<NSURLConnectionDataDelegate,NSURLConnectionDelegate>{
NSMutableData *receiveData ;
}
@property (nonatomic,strong) KeyValueView * userNameView;
@property (nonatomic,strong) KeyValueView * sexView;
@property (nonatomic,strong) KeyValueView * birthdayView;
@property (nonatomic,strong) KeyValueView * emailView;
@property (nonatomic,strong) KeyValueView * phoneView;
@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    int width = [[UIScreen mainScreen] bounds].size.width;
    //int height = [[UIScreen mainScreen] bounds].size.height ;
    
    UILabel *titleLabel  = [[UILabel alloc] initWithFrame:CGRectMake(0,40, width, 20)];
    [titleLabel setText:@"个人用户信息"];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:titleLabel];
    
    _userNameView = [[KeyValueView alloc] initWithFrame:CGRectMake(100,70, width - 100*2, 30)];
    _userNameView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_userNameView];
    
    _sexView = [[KeyValueView alloc] initWithFrame:CGRectMake(100,70+30, width - 100*2, 30)];
    _sexView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_sexView];
    
    _birthdayView = [[KeyValueView alloc] initWithFrame:CGRectMake(100,70+30*2, width - 100*2, 30)];
    _birthdayView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_birthdayView];
    
    _emailView = [[KeyValueView alloc] initWithFrame:CGRectMake(100,70 + 30 *3, width - 100*2, 30)];
    _emailView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_emailView];
    
    _phoneView = [[KeyValueView alloc] initWithFrame:CGRectMake(100,70 + 30 * 4, width - 100*2, 30)];
    _phoneView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_phoneView];
    
    UIButton *getUserInfoButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 70 + 30 * 5, width - 100*2, 30)];
    getUserInfoButton.backgroundColor = [UIColor redColor];
    [getUserInfoButton setTitle:@"GetUser" forState:UIControlStateNormal];
    [getUserInfoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [getUserInfoButton addTarget:self action:@selector(loadWebRequest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getUserInfoButton];
    
    
    
    UIButton *webViewBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 70 + 30 * 8, width - 100*2, 30)];
    webViewBtn.backgroundColor = [UIColor redColor];
    [webViewBtn setTitle:@"webview" forState:UIControlStateNormal];
    [webViewBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [webViewBtn addTarget:self action:@selector(loadWebView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:webViewBtn];
    
    CircleImageView* circleImageView = [[CircleImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
   // [circleImageView loadImage:@"image.png"];
    [circleImageView loadNetImage:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=415293130,2419074865&fm=26&gp=0.jpg"];
    
    [circleImageView loadLocalImage:@"image.png"];
    [self.view addSubview:circleImageView];
    
    UIButton *sqlBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 70 + 30 * 9+20, width - 100*2, 30)];
    sqlBtn.backgroundColor = [UIColor redColor];
    [sqlBtn setTitle:@"sqldb" forState:UIControlStateNormal];
    [sqlBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sqlBtn addTarget:self action:@selector(loadSql:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sqlBtn];
    
    UIButton *plistBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 70 + 30 * 10+20, width - 100*2, 30)];
    plistBtn.backgroundColor = [UIColor redColor];
    [plistBtn setTitle:@"create plist" forState:UIControlStateNormal];
    [plistBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [plistBtn addTarget:self action:@selector(createPlist:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plistBtn];
    
    UIButton *plistBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 70 + 30 * 11+20, width - 100*2, 30)];
    plistBtn1.backgroundColor = [UIColor redColor];
    [plistBtn1 setTitle:@"load plist" forState:UIControlStateNormal];
    [plistBtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [plistBtn1 addTarget:self action:@selector(loadPlist:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plistBtn1];

    
}

-(void)loadPlist:(UIButton *)btn{
    //获取本地沙盒路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // 获取完整路径
    NSString *documentsPath = [path objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"newTest.plist"];
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSLog(@"%@",data);
}

-(void)createPlist:(UIButton *)btn{
    //获取本地沙盒路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    // 获取完整路径
    NSString *documentsPath = [path objectAtIndex:0];
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"newTest.plist"];
    //创建数据
    NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
    [newDict setObject:@"name" forKey:@"hudan"];
    [newDict setObject:@"age" forKey:@"27"];
    
    [newDict writeToFile:plistPath atomically:YES];
}

-(void)loadSql:(UIButton *)btn{
    DataBaseHandle * database = [DataBaseHandle shareDataBaseHandler];
    [database dbPath];
    [database openDB];
    //[database createTable];
    //[database closeDB];
    
//    [database insertName:@"xxx" gender:@"girl" age:18];
//    [database insertName:@"小花" gender:@"女" age:12];
//    [database insertName:@"小铭" gender:@"男" age:21];
    
    //[database searchAll];
    [database searchWithName:@"xxx"];
    [database closeDB];
}

-(void)loadWebView:(UIButton *)btn{
    [self.navigationController popToRootViewControllerAnimated:YES];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = [[WebViewController alloc]init];
}

-(void)loadWebRequest:(UIButton *)btn{
    receiveData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.105:8080/response.json"];
    // 默认请求Get
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}
// 接受网络请求响应结果
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
  //  NSLog(@"%@",response);
}
// 接受网络响应数据,该方法会被调用多次，吧请求到的结果拼接起来
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
   // NSLog(@"%@",data);
    if(receiveData == nil){
        receiveData = [[NSMutableData alloc] init];
    }
    [receiveData appendData: data];
}

//网络请求结束
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // 处理最后的结果
    id obj = [NSJSONSerialization JSONObjectWithData:receiveData options:NSJSONReadingMutableContainers error:nil];
     NSLog(@"---%@",obj);
    if([obj isKindOfClass:[NSDictionary class]]){
        NSDictionary * data = [(NSDictionary *)obj objectForKey:@"data"];
        NSString *userName = [data objectForKey:@"userName"];
        NSNumber *sex = [data objectForKey:@"sex"];
        if(sex == 1){
            sex = @"女";
        }else{
            sex = @"男";
        }
        NSString *birthday = [data objectForKey:@"birthday"];
        NSString *email = [data objectForKey:@"email"];
        NSString *phone = [data objectForKey:@"phone"];
        
        [_userNameView setupKey:@"姓名" value:userName];
        [_sexView setupKey:@"性别" value:sex];
        [_birthdayView setupKey:@"生日" value:birthday];
        [_emailView setupKey:@"邮箱" value:email];
        [_phoneView setupKey:@"电话" value:phone];
        NSLog(@"%@",sex);
    }
    NSString *jsonString = [[NSString alloc] initWithData:receiveData encoding:NSUTF8StringEncoding];
    NSLog(@"++++%@",jsonString);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
