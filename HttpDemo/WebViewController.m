//
//  WebViewController.m
//  HttpDemo
//
//  Created by mac on 18/9/26.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UISearchBarDelegate>
@property (nonatomic,strong) UISearchBar *searchBar ;
@property (nonatomic,strong) UIButton *searchButton ;
@property (nonatomic,strong) UIWebView *webView ;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:0.776 green:0.776 blue:0.8 alpha:1.0];
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(15, 34, self.view.frame.size.width - 15 * 2 - 60, 44)];
    _searchBar.backgroundColor = [UIColor clearColor];
    _searchBar.placeholder = @"http://www.baidu.com";
    _searchBar.delegate = self;
    [self.view addSubview:_searchBar];
    
    _searchButton = [[UIButton alloc] initWithFrame:CGRectMake(_searchBar.frame.origin.x + _searchBar.frame.size.width + 10, 41, 60, 30)];
    _searchButton.backgroundColor = [UIColor clearColor];
    [_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    [_searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _searchButton.layer.cornerRadius = 5.0;
    _searchButton.layer.borderWidth = 1.0;
    _searchButton.backgroundColor = [UIColor clearColor];
    [_searchButton addTarget:self action:@selector(searchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_searchButton];
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 85, self.view.frame.size.width, self.view.frame.size.height - 85)];
    _webView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_webView];
    
}
// 按钮点击
-(void)searchAction:(id)sender{
    NSLog(@"searchAction");
    
    NSString *urlText = [_searchBar text];
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

//点击软键盘搜索框事件
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [_searchBar resignFirstResponder];
    NSLog(@"searchBarSearchButtonClicked");
    NSString *urlText = [_searchBar text];
    NSURL *url = [NSURL URLWithString:urlText];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
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
