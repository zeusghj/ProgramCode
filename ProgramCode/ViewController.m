//
//  ViewController.m
//  ProgramCode
//
//  Created by 郭洪军 on 9/21/16.
//  Copyright © 2016 Guo Hongjun. All rights reserved.
//

#import "ViewController.h"
#import "BTToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton* testBtn = [[UIButton alloc] init];
    [testBtn setTitle:@"测试" forState:UIControlStateNormal];
    [testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    testBtn.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2, 100, 30) ;
    [testBtn addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
    
}

- (void)test:(id)sender {
    [BTToast showToast:@"登陆成功"];
}

@end
