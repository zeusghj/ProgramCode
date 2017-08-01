//
//  HJLazyArray.h
//  TestSomethings
//
//  Created by 郭洪军 on 8/1/17.
//  Copyright © 2017 Guo Hongjun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^HJLazyArrayItemBlock)(NSInteger index);

@interface HJLazyArray : NSArray
- (instancetype)initWithItemBlock:(HJLazyArrayItemBlock)block count:(NSInteger)count;
@end
