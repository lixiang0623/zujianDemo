//
//  YWViewController.m
//  qili
//
//  Created by p_ilxiangli on 04/08/2024.
//  Copyright (c) 2024 p_ilxiangli. All rights reserved.
//

#import "YWViewController.h"

#import <qili/Common.h>
#import <qili/QiliChannelDelegate.h>
#import <QiLiSDK/QiLiSDK.h>

@interface YWViewController ()

@end

@implementation YWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[QiLiSDK shareInstance] initSDKWithGameID:@"337" secretKey:@"8f84ff522e5a4360ae66eabc96a4de58" delegate:self];
    
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    NSString *name = info[@"ChannelName"];
    Class c = NSClassFromString(name);
    id cls = [[c alloc] init];
    NSLog(@"cls:%@", cls);
    
    
    NSString *bundlePath=[[NSBundle mainBundle] pathForResource:@"QliLiBundle" ofType:@"bundle"];
    NSBundle *bundle=[NSBundle bundleWithPath:bundlePath];
    NSString *plistpasth=[bundle pathForResource:@"QL_Config" ofType:@"plist"];
    
    NSDictionary *dic=[NSDictionary dictionaryWithContentsOfFile:plistpasth];
    
    NSLog(@"dic--%@",dic);
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
