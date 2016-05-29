//
//  ViewController.m
//  MoreBtn
//
//  Created by mac on 16/5/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    
    [super viewDidLoad];
    [self createMoreView];
}


-(void)createMoreView
{
    MenuArray  = [NSMutableArray arrayWithObjects:
                  [MoreModel creatModel:@"日历" imageName:@"workCalendar" isEnable:YES],
                  [MoreModel creatModel:@"GPS" imageName:@"signal" isEnable:NO],
                  [MoreModel creatModel:@"签到" imageName:@"outSig" isEnable:YES],
                  [MoreModel creatModel:@"蓝牙" imageName:@"blueSig" isEnable:NO],
                  [MoreModel creatModel:@"扫码" imageName:@"QRCode" isEnable:NO],
                  [MoreModel creatModel:@"列表" imageName:@"list" isEnable:YES],
                  nil];
    
    moremenView = [[MoreMenuView alloc]initWithArray:MenuArray colcount:3 height:60];
    moremenView.delegate = self;
    moremenView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49);
    [self.view addSubview:moremenView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moreMenuBtn:(SingleState)tag
{
    NSLog(@"按钮%d",tag);
}


@end
