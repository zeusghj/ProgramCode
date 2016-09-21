//
//  BTToast.h
//  ProgramCode
//
//  Created by 郭洪军 on 9/21/16.
//  Copyright © 2016 Guo Hongjun. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BTToast(title) [BTToast showToast:title]

#define BTToastError(error) [BTToast showToastError:error]

@interface BTToast : NSObject

+ (void)showToast:(NSString *)title;

+ (void)showToastError:(NSError *)error;

+ (void)showToast:(NSString *)title state:(BOOL)isSuccess;

@end
