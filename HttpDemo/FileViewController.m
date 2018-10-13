//
//  FileViewController.m
//  HttpDemo
//
//  Created by mac on 18/10/5.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "FileViewController.h"

@interface FileViewController ()

@end

@implementation FileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
    // Do any additional setup after loading the view.
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    
    NSString *cacheDirectoryPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Caches"];
    
    NSString *regionListFile = [cacheDirectoryPath stringByAppendingPathComponent:@"regionList.txt"];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"regionList" withExtension:@"txt"];
  //  NSURL *url = [NSURL fileURLWithPath:cacheDirectoryPath];
    
    NSLog(@"---%@",cacheDirectoryPath);
    NSLog(@"---%@",regionListFile);
    
    // write to file
//    NSString *tmpStr = [[NSString alloc] initWithData:regionListFile->currentData encoding: NSUTF8StringEncoding];
    NSString *tmpStr = @"123";
    BOOL resultFlag = [tmpStr writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if(resultFlag){
        NSLog(@"write success");
    }else{
        NSLog(@"write error");
    }
     **/
    
    // 获取Documents目录
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];

    // 获取tmp目录
    NSString *tmpPath = NSTemporaryDirectory();
    // 获取Library目录
    NSString *libPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    
    // 获取Library/Caches目录
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    // 获取Library/Preferences目录
    NSString *prePath = [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
    //通常情况下，Preferences由系统维护，我们很少去操作TA
    
    // 获取应用程序包的路径
    NSString *path = [NSBundle mainBundle].resourcePath;
    
    
//    NSLog(@"docpath=%@ tmppath=%@ libpath=%@ cachepath=%@ prepath=%@ path=%@",docPath,tmpPath,libPath,cachePath,prePath,path);
    
    /**
    docpath=/Users/mac/Library/Developer/CoreSimulator/Devices/FB25FDD7-0F39-481D-96E8-D0444FB3B785/data/Containers/Data/Application/328BF212-122E-4577-B073-5DEC8D44ACD0/Documents
    tmppath=/Users/mac/Library/Developer/CoreSimulator/Devices/FB25FDD7-0F39-481D-96E8-D0444FB3B785/data/Containers/Data/Application/328BF212-122E-4577-B073-5DEC8D44ACD0/tmp/ 
    libpath=/Users/mac/Library/Developer/CoreSimulator/Devices/FB25FDD7-0F39-481D-96E8-D0444FB3B785/data/Containers/Data/Application/328BF212-122E-4577-B073-5DEC8D44ACD0/Library
    cachepath=/Users/mac/Library/Developer/CoreSimulator/Devices/FB25FDD7-0F39-481D-96E8-D0444FB3B785/data/Containers/Data/Application/328BF212-122E-4577-B073-5DEC8D44ACD0/Library/Caches
    prepath=/Users/mac/Library/Developer/CoreSimulator/Devices/FB25FDD7-0F39-481D-96E8-D0444FB3B785/data/Containers/Data/Application/328BF212-122E-4577-B073-5DEC8D44ACD0/Library/PreferencePanes
    path=/Users/mac/Library/Developer/CoreSimulator/Devices/FB25FDD7-0F39-481D-96E8-D0444FB3B785/data/Containers/Bundle/Application/657D8E48-5020-4894-BD4A-01E8359EF749/HttpDemo.app
     **/
    
    // －－－－－－读写字符串－－－－－－
    /**
    NSString *txtPath = [docPath stringByAppendingPathComponent:@"objc.txt"]; // 此时仅存在路径，文件并没有真实存在
    NSString *string = @"Objective-C";
    
    // 字符串写入时执行的方法
    [string writeToFile:txtPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"txtPath is %@", txtPath);
    
    // 字符串读取的方法
    NSString *resultStr = [NSString stringWithContentsOfFile:txtPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"resultStr is %@", resultStr);
    **/
    // --------NSArray------
    // 数组写入文件
    // 创建一个存储数组的文件路径
    /**
    NSString *filePath = [docPath stringByAppendingPathComponent:@"language.txt"];
    NSArray *array = @[@"C语言", @"JAVA",@"Objective-C", @"Swift", @"PHP", @"C++", @"C#"];
    // 数组写入文件执行的方法
    [array writeToFile:filePath atomically:YES];
    NSLog(@"filePath is %@", filePath);
    
    // 从文件中读取数据数组的方法
    NSArray *resultArr = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@", resultArr[1]);
    **/
    
    //  -------NSDictionary------
    // 字典写入文件
    // 创建一个存储字典的文件路径
    /**
    NSString *fileDicPath = [docPath stringByAppendingPathComponent:@"love.txt"];
    NSDictionary *dic = @{@"职业":@"程序员", @"梦想":@"代码无BUG"};
    
    // 字典写入时执行的方法
    [dic writeToFile:fileDicPath atomically:YES];
    NSLog(@"fileDicPath is %@", fileDicPath);
    
    // 从文件中读取数据字典的方法
    NSDictionary *resultDic = [NSDictionary dictionaryWithContentsOfFile:fileDicPath];
    NSLog(@"%@", resultDic[@"梦想"]);
     **/
    
    
    //-----------NSData-----------
    // NSData写入文件
    // 创建一个存放NSData数据的路径
    NSString *fileDataPath = [docPath stringByAppendingPathComponent:@"image"];
    
    // 得到一个UIImage对象
    UIImage *image = [UIImage imageNamed:@"image"];
    
    // 将UIImage对象转换成NSData对象
    NSData *data = UIImageJPEGRepresentation(image, 0);
    [data writeToFile:fileDataPath atomically:YES];
    NSLog(@"fileDataPath is %@", fileDataPath);
    
    // 从文件读取存储的NSData数据
    NSData *resultData = [NSData dataWithContentsOfFile:fileDataPath];
    // 将得到的NSData数据转换成原有的图片对象
    UIImage *resultImage = [UIImage imageWithData:resultData];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = resultImage;
    [self.view addSubview:imageView];
    

    
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
