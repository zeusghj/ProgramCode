//
//  UITabBar+badge.m
//  LuckBar
//
//  Created by 郭洪军 on 9/29/16.
//  Copyright © 2016 宋晓建. All rights reserved.
//

#import "UITabBar+badge.h"

#define TabbarBadge_Nums 4.0

@implementation UITabBar (badge)

//显示小红点
- (void)showBadgeOnItemIndex:(NSInteger)index withNum:(NSInteger)badgeNum {
    
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UILabel* labNum = [[UILabel alloc] init];
    labNum.tag = 888 + index;
    labNum.layer.cornerRadius = 20/2;  //圆形
    labNum.layer.masksToBounds = YES;
    labNum.backgroundColor = [UIColor colorWithRed:253/255.0f green:105/255.0f blue:140/255.0f alpha:1];
    
    CGRect tabFrame = self.frame;
    //确定小红点的位置
    float percentX = (index + 0.6) / TabbarBadge_Nums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height) - 5;
    labNum.frame = CGRectMake(x, y, 20, 20);
    
    labNum.text = [NSString stringWithFormat:@"%ld",badgeNum];
    labNum.textColor = [UIColor whiteColor];
    labNum.adjustsFontSizeToFitWidth = YES;
    labNum.textAlignment = NSTextAlignmentCenter;
    [self addSubview:labNum];
    
    [self bringSubviewToFront:labNum];
    
}

- (void)hideBadgeOnItemIndex:(NSInteger)index {
    
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}

- (void)removeBadgeOnItemIndex:(NSInteger)index {
    
    //按照tag值进行移除
    for (UIView* subView in self.subviews) {
        if (subView.tag == 888 + index) {
            [subView removeFromSuperview];
        }
    }
}

@end
