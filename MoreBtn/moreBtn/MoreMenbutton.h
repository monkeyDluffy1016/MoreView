//
//  btn.h
//  MoreBtn
//
//  Created by mac on 16/5/29.
//  Copyright © 2016年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger
{
    fisrt = 0,
    second,
    third,
    fourth,
    fifth,
    sixth,
} SingleState;


@protocol MoreMenuDelegate <NSObject>
@required
-(void)moreMenuBtn:(SingleState)tag;
@end



@interface MoreMenbutton : UIButton
{
    CGFloat  gTop;
}
-(instancetype)initWithFrame:(CGRect)frame;
/*修改title和image的距离   UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
 */
-(void)setTitleTop:(NSInteger)top;
@end


