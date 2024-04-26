//
//  YWGameChannelProtocol.h
//  YWGameUnionSDK
//
//  Created by 何伟 on 2018/9/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YWGameChannelProtocol <NSObject>

@required
/**
 该方法用于提前初始化渠道SDK，有些渠道SDK里的头条SDK必需要先初始化
 */
- (void)initAhead;
- (void)initSDK;

@required
- (void)login:(NSDictionary *)param_dic onSuccess:(void (^)(NSDictionary *))onSuccess onFailed:(void (^)(NSError *))onFailed;

@required
- (void)pay:(NSDictionary *)param_dic onSuccess:(void (^)(NSString *))onSuccess onFailed:(void (^)(NSError *))onFailed onCancel:(void (^)(NSError *))onCancel;

@required
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

@optional
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;

@required
- (void)logout:(void (^)(NSString *))onSuccess onFailed:(void (^)(NSError *))onFailed;
- (void)setOnLogoutCompleteListener:(void (^)(NSString *result))onSuccess;
@required
- (void)setExtraData:(int)eventType RoleInfo:(NSDictionary *)roleInfo;

@end
