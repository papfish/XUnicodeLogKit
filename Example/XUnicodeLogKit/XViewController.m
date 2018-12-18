//
//  XViewController.m
//  XUnicodeLogKit
//
//  Created by xuliang2015 on 12/18/2018.
//  Copyright (c) 2018 xuliang2015. All rights reserved.
//

#import "XViewController.h"

@interface XViewController ()

@end

@implementation XViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)logTestEvent:(UIButton *)sender {
    
    // dictionary
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    
    // string
    [mDict setObject:@"我是中国人" forKey:@"字符串"];
    
    // array
    NSMutableArray *mArray = [NSMutableArray array];
    [mArray addObject:@"我是中国人"];
    [mArray addObject:@"chinese"];
    [mDict setObject:mArray forKey:@"数组"];
    
    // set
    NSMutableSet *mSet = [NSMutableSet set];
    [mSet addObject:@"我是中国人"];
    [mSet addObject:@"chinese"];
    [mDict setObject:mSet forKey:@"集合"];
    
    // data
    NSData *data = [@"[\"我是中国人\", \"我我我\"]" dataUsingEncoding:NSUTF8StringEncoding];
    [mDict setObject:data forKey:@"NSData"];
    
    // object
    [mDict setObject:[[XViewController alloc] init] forKey:@"对象"];
    
    NSLog(@"%@", mDict);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
