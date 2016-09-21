//
//  BTToast.m
//  ProgramCode
//
//  Created by 郭洪军 on 9/21/16.
//  Copyright © 2016 Guo Hongjun. All rights reserved.
//

#import "BTToast.h"
#import <UIKit/UIKit.h>

#define kBTToastViewTag 875690

@implementation BTToast

+ (UIView *)toastWithTitle:(NSString *)title {
    UIView* toastView = [[UIView alloc] init];
    toastView.layer.cornerRadius = 3.f;
    toastView.layer.masksToBounds = YES;
    toastView.backgroundColor = [BTToast colorFromHexString:@"222222"];
    toastView.layer.borderWidth = 0.5f;
    toastView.layer.borderColor = [BTToast colorFromHexString:@"404040"].CGColor;
    toastView.tag = kBTToastViewTag;
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:14.];
    [titleLabel sizeToFit];
    
    toastView.frame = CGRectMake(toastView.frame.origin.x, toastView.frame.origin.y, titleLabel.frame.size.width + 2 * 10, titleLabel.frame.size.height + 2 * 4);
    [toastView addSubview:titleLabel];
    titleLabel.center = CGPointMake(toastView.bounds.size.width/2, toastView.bounds.size.height/2);
    
    return toastView;
}

+ (void)showToast:(NSString *)title {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if ([[UIApplication sharedApplication].keyWindow viewWithTag:kBTToastViewTag]) {
            [[[UIApplication sharedApplication].keyWindow viewWithTag:kBTToastViewTag] removeFromSuperview];
        }
        
        UIView* toastView = [BTToast toastWithTitle:title];
        
        [[UIApplication sharedApplication].keyWindow addSubview:toastView];
        
        toastView.center = CGPointMake([[UIApplication sharedApplication] keyWindow].frame.size.width/2, [[UIScreen mainScreen] bounds].size.height - 120 - toastView.frame.size.height);

        toastView.alpha = 0.f;
        
        [UIView animateWithDuration:0.26 animations:^{
            toastView.alpha = 1.f;
            
        } completion:^(BOOL finished) {
            
           dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
               
               [BTToast makeToastHiddenAndRemove];
               
           });
        }];
        
    });
    
}

+ (void)makeToastHiddenAndRemove {
    UIView* toastView = [[[UIApplication sharedApplication] keyWindow] viewWithTag:kBTToastViewTag];
    
    [UIView animateWithDuration:0.26 animations:^{
        
        toastView.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [toastView removeFromSuperview];
        
    }];
}

+ (void)showToastError:(NSError *)error {

    NSString* errMsg = [error.userInfo objectForKey:@"errMsg"];
    
    [BTToast showToast:errMsg];
}

+ (void)showToast:(NSString *)title state:(BOOL)isSuccess {
    
}

+ (BOOL)stringIsNull:(NSString *)string
{
    if (![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (!string || [string isKindOfClass:[NSNull class]] || string.length == 0 ||[string isEqualToString:@""]) {
        return YES;
    }else {
        return NO;
    }
}

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    if ([BTToast stringIsNull:hexString]) {
        return nil;
    }
    
    unsigned hexNum;
    if (![[NSScanner scannerWithString:hexString] scanHexInt:&hexNum]) {
        return nil;
    }
    
    return [UIColor colorWithRed:((float)((hexNum & 0xFF0000) >> 16))/255.0 green:((float)((hexNum & 0xFF00) >> 8))/255.0 blue:((float)(hexNum & 0xFF))/255.0 alpha:1.0];
}

@end
