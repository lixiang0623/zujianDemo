//
//  XuYangChannelDelegate.h
//  YWUnionSDK
//
//  Created by 李祥 on 2023/3/7.
//  Copyright © 2023 yuewen. All rights reserved.
//

#import "YWGameChannelProtocol.h"


@interface QiliChannelDelegate : NSObject <YWGameChannelProtocol>

// 声明一个指向代理对象的指针变量，遵循协议,协议一般使用弱引用,若用强引用，会造成双向代理死锁问题
@property (nonatomic,retain) id <YWGameChannelProtocol> delegate;

@end
