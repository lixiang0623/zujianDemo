//
//  QiLiSDK.h
//  QiLiSDK
//
//  Created by 刘落星 on 2021/5/6.
//  Copyright © 2021 Star. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "QLRoleDataInfo.h"
#import "QLProductInfo.h"

NS_ASSUME_NONNULL_BEGIN

@protocol QiLiSDKDelegate <NSObject>

// 登陆成功回调
-(void)qiliSDKLoginSuccess:(QLUserInfo *)userInfo;

// 登出回调
-(void)qiliSDKLogout;

@end


@interface QiLiSDK : NSObject

//需要将dispatch_source_t timer设置为成员变量，不然会立即释放
@property (nonatomic, strong) dispatch_source_t timer;
@property(nonatomic,assign)BOOL isSuspend;//定时器挂起状态

@property (nonatomic, weak) id<QiLiSDKDelegate> qiliDelegate;


/**
 * 获取单例实体对象，所有方法都使用该实例对象进行调用
 */
+(instancetype)shareInstance;

/**
 * 获取SDK配置信息
 * @gameID 游戏ID
 * @key 加密Key
 * @qlDelegate 代理
 */
-(void)initSDKWithGameID:(NSString *)gameID secretKey:(NSString *)key delegate:(id<QiLiSDKDelegate>)qlDelegate;

/**
 * 显示登录视图
 */
-(void)showLoginView;

/**
 * 登出
 */
-(void)logout;

/**
 * 支付窗口
 * @view  支付窗口所在父视图
 * @payModel 支付model
 */
-(void)payWithPayModel:(QLProductInfo *)productInfo;

/**
 * 上传游戏数据
 *  @userInfo  上报角色对象模型
 */
-(void)submitUserInfo:(QLRoleDataInfo *)roleDataInfo;

@end

NS_ASSUME_NONNULL_END
