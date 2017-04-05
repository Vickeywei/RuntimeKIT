//
//  ViewController.m
//  RuntimeKit
//
//  Created by JennyC on 2017/3/14.
//  Copyright © 2017年 Zhang-YG. All rights reserved.
//

#import "ViewController.h"
#import "RuntimeKit.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = [RuntimeKit fetchClassInstanceMethodListWithClass:[ViewController class]];
    NSLog(@"%@",array);
    NSArray *array2 = [RuntimeKit fetchIvarListWithClass:[ViewController class]];
    NSLog(@"%@",array2);
    
    NSLog(@"%@",[RuntimeKit fetchClassName:[ViewController class]]);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)setUpView{
    
}

- (void)setUpData {
    
}

@end
