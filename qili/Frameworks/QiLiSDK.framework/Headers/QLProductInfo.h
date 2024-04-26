//
//  QLProductInfo.h
//  QiLiSDK
//
//  Created by 刘落星 on 2021/5/6.
//  Copyright © 2021 Star. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class QLProductInfo;
@protocol QiLiSDKPayDelegate <NSObject>

//SDK回调
-(void)payWithPayment:(NSString *)paymentType productInfo:(QLProductInfo *)productInfo;

@end

@interface QLProductInfo : NSObject

@property (nonatomic, copy) NSString *userID;//用户id
@property (nonatomic, copy) NSString *serverID;//区服id
@property (nonatomic, copy) NSString *serverName;//区服名称
@property (nonatomic, copy) NSString *produceID;//产品ID(IAP支付的产品id)
@property (nonatomic, copy) NSString *produceName;//产品名称
@property (nonatomic, copy) NSString *productDesc;//产品描述
@property (nonatomic, copy) NSNumber *price;//价格(以分为单位)
@property (nonatomic, copy) NSString *cpData;//透传参数
@property (nonatomic, copy) NSString *cpOrder;//厂商订单号
@property (nonatomic, copy) NSString *roleID;//角色ID
@property (nonatomic, copy) NSString *roleName;//角色名称
@property (nonatomic, copy) NSString *roleLevel;//角色等级

@end

NS_ASSUME_NONNULL_END
