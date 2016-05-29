//
//  MoreMenuView.h
//  IEmpolyeePorject
//
//  Created by mac on 16/5/9.
//  Copyright © 2016年 com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreMenbutton.h"
#define ScreenWidth   [UIScreen  mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen  mainScreen].bounds.size.height

@interface MoreModel : NSObject
@property(nonnull,strong,nonatomic)NSString *title;
@property(nonnull,strong,nonatomic)NSString *imageName;
@property(nonnull,strong,nonatomic)NSNumber *enable;
+(_Nonnull  instancetype )creatModel:(nonnull NSString*)title
                           imageName:(nonnull NSString*)imageName
                            isEnable:(BOOL)isenable;
@end




//9宫格的View
@interface MoreMenuView : UIView
{
    NSArray     *menuDataArray;
    NSInteger   colCount;
    NSInteger   gheight;
}
@property(nonatomic,weak) id <MoreMenuDelegate> delegate;

/**
 *  创建一个View
 *
 *  @param menuArray  要创建的数组
 *  @param colcount   需要分成的列
 *  @param height     高度
 *
 *  @return 返回一个View
 */
-(instancetype)initWithArray:(NSMutableArray*)menuArray
                    colcount:(NSInteger)colcount
                      height:(NSInteger)height;
-(void)createBtn;



@end



