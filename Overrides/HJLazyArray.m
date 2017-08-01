//
//  HJLazyArray.m
//  TestSomethings
//
//  Created by 郭洪军 on 8/1/17.
//  Copyright © 2017 Guo Hongjun. All rights reserved.
//

#import "HJLazyArray.h"

@interface HJLazyArray ()

@property (nonatomic, copy)HJLazyArrayItemBlock block;

@end

@implementation HJLazyArray
{
    NSInteger _ct;
}

- (instancetype)initWithItemBlock:(HJLazyArrayItemBlock)block count:(NSInteger)count {
    if (self = [super init]) {
        _ct = count;
        self.block = block;
    }
    return self;
}

#pragma mark - override
- (NSUInteger)count {
    return _ct;
}

- (id)objectAtIndex:(NSUInteger)index {
    return self.block(index);
}

@end
