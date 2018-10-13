//
//  RealmViewController.m
//  HttpDemo
//
//  Created by mac on 18/10/2.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "RealmViewController.h"
#import "Realm/Realm.h"

@interface Dog : RLMObject
@property NSString* name;
@property NSInteger age ;
@end
RLM_ARRAY_TYPE(Dog);
@interface Person : RLMObject
@property NSString* name;
@property RLMArray<Dog> *dogs;
@end

@implementation Dog
@end

@implementation Person
@end




@interface RealmViewController ()

@end

@implementation RealmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Dog *dog = [[Dog alloc] init];
    dog.name = @"dog1";
    dog.age = 1;
    
    Person *owner = [[Person alloc] init];
    owner.name = @"hudan";
    [owner.dogs addObject:dog];
    
    // search
    RLMResults *results = [Dog objectsWhere:@"age < 2"];
    NSLog(@"%@",results);
    // add dog to db
    RLMRealm* r=  [RLMRealm defaultRealm];
    [r transactionWithBlock:^{
        // add dog
        [r addObject:dog];
    }];
    NSLog(@"%@",results);

    
//    [r beginWriteTransaction];
//    // add dog
//    [r commitWriteTransaction];
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
