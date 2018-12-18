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
    
    NSDictionary *dict = @{@"key": @"我是中国人"};
    NSLog(@"%@", dict);
    
    NSArray *array = @[@"我是中国人"];
    NSLog(@"%@", array);
    
    NSArray *array2 = @[[@"我是中国人" dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"%@", array2);
    
    NSArray *array3 = @[[[XViewController alloc] init]];
    NSLog(@"%@", array3);
    
    NSSet *set = [NSSet setWithObjects:[[XViewController alloc] init], @"我是中国人", nil];
    NSLog(@"%@", set);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
