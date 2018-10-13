//
//  DataBaseHandle.h
//  HttpDemo
//
//  Created by mac on 18/9/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DataBaseHandle : NSObject

+(DataBaseHandle *) shareDataBaseHandler;

-(void)getPath:(NSString *)path;
-(NSString *)dbPath;
-(void)openDB;
-(void)closeDB;
-(void)createTable;
-(void)insertName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;
-(void)updateWithUID:(NSInteger)uid;
-(void)deleteWithUID:(NSInteger)uid;

-(void)searchAll;
-(void)searchWithName:(NSString *)name;

@end
