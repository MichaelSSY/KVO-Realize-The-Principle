//
//  NSKVONotifying_Person.m
//  BlockTest
//
//  Created by weiyun on 2018/1/20.
//  Copyright © 2018年 孙世玉. All rights reserved.
//

#import "NSKVONotifying_Person.h"

@implementation NSKVONotifying_Person

// 我这里只是模拟这个类的实现，在项目中我们是看不到这个类的

- (void)setName:(NSString *)name
{
    [self willChangeValueForKey:@"name"];// 老值
    [super setName:name];
    [self didChangeValueForKey:@"name"]; // 新值
}
@end
