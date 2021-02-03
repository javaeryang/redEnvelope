//
//  WeChatRedEnvelopParamQueue.h
//  001--WeChatDemo11Dylib
//
//  Created by H on 2018/5/28.
//  Copyright © 2018年 H. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeChatRedEnvelopParamQueue : NSObject
+(instancetype)sharadQueue;
-(void)enqueue:(NSMutableDictionary *)param;
-(NSMutableDictionary *)dequeue;

@end
