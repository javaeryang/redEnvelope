//
//  WeChatRedEnvelopParamQueue.m
//  001--WeChatDemo11Dylib
//
//  Created by H on 2018/5/28.
//  Copyright © 2018年 H. All rights reserved.
//

#import "WeChatRedEnvelopParamQueue.h"

@interface WeChatRedEnvelopParamQueue()
@property(nonatomic,strong)NSMutableArray * queue;
@end

@implementation WeChatRedEnvelopParamQueue

static WeChatRedEnvelopParamQueue *queue = nil;

+(instancetype)sharadQueue
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[WeChatRedEnvelopParamQueue alloc] init];
    });
    return queue;
}

-(instancetype)init{
    if (self = [super init]) {
        _queue = [NSMutableArray array];
    }
    return self;
}
-(void)enqueue:(NSMutableDictionary *)param{
    [self.queue addObject:param];
}
-(NSMutableDictionary *)dequeue
{
    if (self.queue.count == 0 && !self.queue.firstObject) {
        return nil;
    }
    NSMutableDictionary * first = self.queue.firstObject;
    
    [self.queue removeObjectAtIndex:0];
    
    return first;
}


@end
