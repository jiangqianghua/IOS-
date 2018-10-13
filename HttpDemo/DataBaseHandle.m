//
//  DataBaseHandle.m
//  HttpDemo
//
//  Created by mac on 18/9/27.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "DataBaseHandle.h"
@interface DataBaseHandle()
@property(nonatomic,strong)NSString *dbPath;
@end

static DataBaseHandle *dataBase = nil;
static sqlite3 * db = nil;
@implementation DataBaseHandle

+(DataBaseHandle *) shareDataBaseHandler{
    if(dataBase == nil){
        dataBase = [[DataBaseHandle alloc] init];
    }
    return dataBase ;
}

-(NSString *)dbPath{
    if(_dbPath == nil){
        NSString *document= [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject];
        _dbPath=[document stringByAppendingPathComponent:@"person.sqlite"];
    }
    return _dbPath;
}
-(void)getPath:(NSString *)path{
    
}

-(void)openDB{
    int result = sqlite3_open(self.dbPath.UTF8String, &db);
    if(result == SQLITE_OK){
        NSLog(@"open db success");
    }else{
        NSLog(@"open db fail");
    }
}

-(void)closeDB{
    int result = sqlite3_close(db);
    if(result == SQLITE_OK){
        NSLog(@"close db success");
    }else{
        NSLog(@"close db fail");
    }
}

-(void)createTable{
    NSString *createStr = @"create table if not exists person (id integer primary key autoincrement not null , name text ,gender text,age integer);";
    int result = sqlite3_exec(db, createStr.UTF8String, NULL, NULL, NULL);
    if(result == SQLITE_OK){
        NSLog(@"create table success");
    }else{
        NSLog(@"create table fail dbpath = %@",_dbPath);
    }
}

-(void)insertName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age{
    NSString *insertStr = @"insert into person(name , gender,age) values(?,?,?)";
    sqlite3_stmt * stmt = nil ;
    int result = sqlite3_prepare(db, insertStr.UTF8String, -1, &stmt, NULL);
    if(result == SQLITE_OK){
        sqlite3_bind_text(stmt, 1, name.UTF8String, -1, NULL);
        sqlite3_bind_text(stmt, 2, gender.UTF8String, -1, NULL);
        sqlite3_bind_int64(stmt,3,age);
        if(sqlite3_step(stmt) == SQLITE_DONE){
            NSLog(@"insert success");
        }else{
            NSLog(@"insert fail");
        }
    }
    
    sqlite3_finalize(stmt);
}

-(void)updateWithUID:(NSInteger)uid{
    NSString * update = @"update person set name='老王' where id = ?";
    sqlite3_stmt *stmt = nil ;
    int result = sqlite3_prepare(db, update.UTF8String, -1, &stmt, NULL);
    if(result == SQLITE_OK){
        sqlite3_bind_int64(stmt, 1, uid);
        if(sqlite3_step(stmt) == SQLITE_DONE){
            NSLog(@"update success");
        }else{
            NSLog(@"update failt");
        }
    }
    sqlite3_finalize(stmt);
}

-(void)deleteWithUID:(NSInteger)uid{
    NSString *deleteStr = [NSString stringWithFormat:@"delete from person where id = %ld",uid];
    int result = sqlite3_exec(db, deleteStr.UTF8String, NULL, NULL, NULL);
    if(result == SQLITE_OK){
        NSLog(@"delete success");
    }else{
        NSLog(@"delete fail");
    }
}

-(void)searchAll{
    NSString *searchAllStr = @"select * from person";
    sqlite3_stmt *stmt = nil;
    int result = sqlite3_prepare(db, searchAllStr.UTF8String, -1, &stmt, NULL);
    if(result == SQLITE_OK){
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            int stu_id = sqlite3_column_int(stmt, 0);
            NSLog(@"stu_id is %d",stu_id);
            NSLog(@"%@",[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 1)]);
            NSLog(@"%@",[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 2)] );
            NSLog(@"%@",[NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 3)] );
        }
    }
    NSLog(@"search all complate");
    sqlite3_finalize(stmt);
}

-(void)searchWithName:(NSString *)name{
    //sql语句
    NSString *searchStr = [NSString stringWithFormat:@"select *from person where name = '%@'",name];
    
    //创建伴随指针
    sqlite3_stmt *stmt = nil;
    
    int result = sqlite3_prepare(db, searchStr.UTF8String, -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        
        //取数据
        //调用一次step就从&stmt取一次数据
        //sqlite3_step每执行一次这个函数就是取出下一条记录
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            //取出数据
            //取出第一列字段的值(int 类型)
            int ID = sqlite3_column_int(stmt, 0);
            //取出第二列字段的值(text 类型)
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            //取出第三列字段的值(text 类型)
            const unsigned char *gender = sqlite3_column_text(stmt, 2);
            //取出第四列字段的值(int 类型)
            int age = sqlite3_column_int(stmt, 3);
            
            NSLog(@"%d %s %s %d",ID,name,gender,age);
        }
    }else{
        NSLog(@"查找失败");
    }
    sqlite3_finalize(stmt);
}

@end
