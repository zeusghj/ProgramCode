//
//  HJAvatarBrowser.m
//  YueAi
//
//  Created by 郭洪军 on 6/6/16.
//  Copyright © 2016 郭洪军. All rights reserved.
//

#import "HJAvatarBrowser.h"

static CGRect oldframe;
@implementation HJAvatarBrowser

+ (void)showImage:(UIImageView *)avatarImageView
{
    UIImage* image = avatarImageView.image;
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    UIView* backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    oldframe = [avatarImageView convertRect:avatarImageView.bounds toView:window];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = 0;
    UIImageView* iamgeView = [[UIImageView alloc]initWithFrame:oldframe];
    iamgeView.image = image;
    iamgeView.tag = 1;
    [backgroundView addSubview:iamgeView];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer:tap];
    
    [UIView animateWithDuration:0.3 animations:^{
        iamgeView.frame = CGRectMake(0, ([[UIScreen mainScreen] bounds].size.height - image.size.height * [[UIScreen mainScreen] bounds].size.width/image.size.width)/2, [[UIScreen mainScreen] bounds].size.width, image.size.height * [[UIScreen mainScreen] bounds].size.width/image.size.width);
        backgroundView.alpha = 1;
    }completion:^(BOOL finished) {
        
    }];
}


+ (void)hideImage:(UITapGestureRecognizer *)tap
{
    UIView* backgroundView = tap.view;
    UIImageView* imageView = (UIImageView *)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame = oldframe;
        backgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}



@end
