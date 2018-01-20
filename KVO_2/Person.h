//
//  Person.h
//  KVO_2
//
//  Created by weiyun on 2018/1/20.
//  Copyright © 2018年 孙世玉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    // 创建成员变量，这里不会给nickname生成setter getter方法
    @public
    // 注意这里必须要写@public公开，否则外部放不了这个成员变量，会报错（说成员变量受到了保护）！！
    NSString * _nickname;
}

@property (nonatomic , copy) NSString *name;

@end
