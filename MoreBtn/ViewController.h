//
//  ViewController.h
//  MoreBtn
//
//  Created by mac on 16/5/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreMenuView.h"



@interface ViewController : UIViewController<MoreMenuDelegate>
{
    MoreMenuView   *moremenView;
    NSMutableArray  *MenuArray;
}

@end

