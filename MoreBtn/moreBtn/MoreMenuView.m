//
//  MoreMenuView.m
//
//
//  Created by mac on 16/5/9.
//  Copyright © 2016年 com. All rights reserved.
//


#import "MoreMenuView.h"
#import "MoreMenbutton.h"
@implementation MoreModel
+(_Nonnull  instancetype )creatModel:(nonnull NSString*)title
                           imageName:(nonnull NSString*)imageName
                            isEnable:(BOOL)isenable
{
    
    MoreModel  *object = [[MoreModel alloc]init];
    object.title = title;
    object.imageName = imageName;
    object.enable = [NSNumber numberWithBool:isenable];
    return object;
}


@end




@implementation MoreMenuView
-(instancetype)initWithArray:(NSMutableArray*)menuArray
                    colcount:(NSInteger)colcount
                      height:(NSInteger)height
{
    self = [super init];
    if (self)
    {
        menuDataArray = menuArray;
        colCount = colcount;
        gheight = height;
        gheight  = 120;
        self.backgroundColor = [UIColor whiteColor];
        [self createBtn];
   
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    if (menuDataArray.count)
    {
        [self createLine];
    }
}


/*
 Weidth  为等分的间距  是常量
 ScreenWidth = 屏幕宽度
 h =  竖线要结束的高度
 Weidth   Weidth*2      Weidth*3
 0-------|---------|-----------|-------ScreenWidth
 1-------|---------|-----------|-------ScreenWidth
 ...     |         |           |
 h-------|---------|-----------|-------ScreenWidth
 */

-(void)createLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, .3f);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetRGBStrokeColor(context, 127 / 255.0, 127 / 255.0, 127 / 255.0, 1.0);  //线的颜色
    CGContextBeginPath(context);
    
    NSInteger  row = menuDataArray.count / 3;
    if (menuDataArray.count % 3)
    {
        row = row+1;
    }
    CGFloat  Weidth = (ScreenWidth-colCount+1) / colCount;
   
    for(NSInteger rowIndex = 0; rowIndex < row; rowIndex++)
    {
        CGContextMoveToPoint(context,  0,          (rowIndex+1)*gheight);  //横线起点坐标
        CGContextAddLineToPoint(context, ScreenWidth,    gheight*(rowIndex+1)); //终点坐标
    }

    for (NSInteger colIndex = 1 ; colIndex < colCount; colIndex++)
    {
        CGContextMoveToPoint(context, Weidth*colIndex+colIndex*1,    0);  //竖线起点坐标
        CGContextAddLineToPoint(context, Weidth*colIndex+colIndex*1, gheight*row);//竖线终点坐标
    }
    
    CGContextStrokePath(context);
}


-(void)createBtn
{
    
    if ([self subviews])
    {
        for (UIView  *subview in [self subviews])
        {
            [subview removeFromSuperview];
        }
    }
    NSInteger  row   = menuDataArray.count / 3;
    if (menuDataArray.count % 3)
    {
        row = row+1;
    }
    CGFloat  Weidth = (ScreenWidth-colCount+1) / colCount;
    for (NSInteger rowIndex = 0; rowIndex < row; rowIndex++)
    {
        for (NSInteger colIndex = 0 ; colIndex < colCount; colIndex++)
        {
            NSInteger count = rowIndex*colCount+colIndex;
            if (count < menuDataArray.count)
            {
                MoreModel *model = menuDataArray[count];
                MoreMenbutton  *btn = [[MoreMenbutton  alloc]initWithFrame:CGRectMake(Weidth*colIndex, rowIndex*gheight, Weidth-1, gheight-1)];
                btn.tag = 1000+count;

                btn.titleLabel.font = [UIFont systemFontOfSize:12];
                [btn setImage:[UIImage imageNamed:model.imageName] forState:UIControlStateNormal];
                [btn setTitle:model.title forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(btnChangeColor:) forControlEvents:UIControlEventTouchDragExit|UIControlEventTouchUpOutside|UIControlEventTouchDragEnter];
                [btn addTarget:self action:@selector(btnHeightPressed:) forControlEvents:UIControlEventTouchDown];
                [btn setTitleTop:20];
                if ([model.enable boolValue])
                {
                    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
                }
                else
                {
                    [btn addTarget:self action:@selector(btnChangeColor:) forControlEvents:UIControlEventTouchUpInside];
                    NSString *unselectImage = [NSString stringWithFormat:@"%@unselec",model.imageName];
                    UIImage *grayImage = [UIImage imageNamed:unselectImage];
                    [btn setImage:grayImage forState:UIControlStateNormal];
                }
                
                btn.frame = CGRectMake(Weidth*colIndex+(colIndex*1+0.3), rowIndex*gheight, Weidth, gheight-0.5);
                [self addSubview:btn];
            }
        }
    }
}

-(void)btnPressed:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    btn.backgroundColor = [UIColor clearColor];
    SingleState  tag = ((UIButton*)sender).tag - 1000;
    [self.delegate moreMenuBtn:tag];
}


-(void)btnChangeColor:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    btn.backgroundColor = [UIColor clearColor];

}
-(void)btnHeightPressed:(id)sender
{
    UIButton  *btn = (UIButton*)sender;
    [btn setBackgroundColor:[UIColor colorWithWhite:0.884 alpha:1.000]];
}


@end
