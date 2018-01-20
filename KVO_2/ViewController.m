//
//  ViewController.m
//  KVO_2
//
//  Created by weiyun on 2018/1/20.
//  Copyright © 2018年 孙世玉. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

static NSString * nameKey;
static NSString *nicknameKey;

@interface ViewController ()
@property (nonatomic , strong) Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    _person = person;
    
    // 监听name 和 nickname，我们来比较下，看看这两种方法创建的属性是不是都能被监听到？
    
    [_person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:&nameKey];
    
    [_person addObserver:self forKeyPath:@"_nickname" options:NSKeyValueObservingOptionNew context:&nicknameKey];
    
    // 通过上面的例子我们发现，name的值变化时被监听到了，而_nickname的值变化时没有被监听到！！
    // 什么原因呢？？？
    
    /** 这时候就要看看KVO的底层实现了，我们就要看看当我们添加监听的时候，苹果内部到底做了哪些事情？ */
    
    
}

// 实现
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == &nameKey) {
        NSLog(@"name改变了");
    }else if (context == &nicknameKey){
        NSLog(@"nickname改变了");
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int i = 0;
    i ++ ;
    _person.name = [NSString stringWithFormat:@"name = %d",i];
    // 访问成员变量 “_对象”或者self->“_变量名”
    _person->_nickname = [NSString stringWithFormat:@"nickname = %d",i];
    NSLog(@"%@   %@",_person.name,_person->_nickname);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
