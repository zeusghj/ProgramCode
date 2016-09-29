//
//  UITabBar+badge.h
//  LuckBar
//
//  Created by 郭洪军 on 9/29/16.
//  Copyright © 2016 宋晓建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)

/**
 *  显示badge
 *  @prama  index  tabbar index   badgeNum  num
 */
- (void)showBadgeOnItemIndex:(NSInteger)index withNum:(NSInteger)badgeNum ;

/**
 *  隐藏角标
 *  @prama  index
 */
- (void)hideBadgeOnItemIndex:(NSInteger)index ;

@end
