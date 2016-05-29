//
//  btn.m
//  MoreBtn
//
//  Created by mac on 16/5/29.
//  Copyright © 2016年 com. All rights reserved.
//
#import "MoreMenbutton.h"
@implementation MoreMenbutton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self verticalImageAndTitle:5];
}

-(void)setTitleTop:(NSInteger)top
{
    gTop = top;
}
- (void)verticalImageAndTitle:(CGFloat)spacing
{
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + spacing);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    
   
    self.titleEdgeInsets = UIEdgeInsetsMake(gTop, - imageSize.width, - (totalHeight - titleSize.height), 0);
    
}

@end
