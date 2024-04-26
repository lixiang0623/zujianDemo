//
//  YoulongChannelDelegate.m
//  YWUnionSDK
//
//  Created by 李祥 on 2023/2/2.
//  Copyright © 2023 yuewen. All rights reserved.
//

#import "QiliChannelDelegate.h"
#import <Foundation/Foundation.h>

#import "Common.h"

#import <QiLiSDK/QiLiSDK.h>



//APPKEY 有SDK提供方（运营）提供
#define SMSDKAppKey @"451b3c1e99d802af5176eb2a5c28295d"


//MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC2Bq8zSxnL1dB1bnw5UGHokqtBTf87Iilbj/TeUddEyvZ88502AGyDyj2Mdjom1/0yxaM0sJ2VGZUEJau7Wz2R52LQOzoEXjz2DzwDVXavB7/pHJxJAvOzJrWOCe05MGCXEij/r2NSoEIG9FwyKUl2W1VpTyZZNhEEamwR7BJ3kQIDAQAB

//登录回调
typedef void (^LoginSuccsful)(NSDictionary *resonseObject);
typedef void (^LoginCancel)(void);
typedef void (^LoginFailure)(NSError *error);

//注销回调
typedef void (^LogoutSuccess)(NSString *);
typedef void (^LogoutFailed)(NSError *);
typedef void (^SDKLogoutSuccess)(NSString *logoutSuccess);

//支付回调
typedef void (^PaySuccess)(NSString *result);
typedef void (^PayFailed)(NSError *error);
typedef void (^PayCanceled)(NSError *error);

@interface QiliChannelDelegate()<QiLiSDKDelegate>

//保存回调
@property (nonatomic , copy) LoginSuccsful loginSuccess;
@property (nonatomic , copy) LoginCancel loginCancel;
@property (nonatomic , copy) LoginFailure loginFailure;

@property (nonatomic, copy) PaySuccess paySuccess;
@property (nonatomic, copy) PayFailed payFailed;
@property (nonatomic, copy) PayCanceled payCanceled;

@property (nonatomic, copy) LogoutSuccess logoutSuccess;
@property (nonatomic, copy) LogoutFailed logoutFailed;
@property (nonatomic , copy) SDKLogoutSuccess sdkLogoutSuccess;
@end

@implementation QiliChannelDelegate : NSObject

//+ (HuixuanChannelDelegate *)shared{
//    static HuixuanChannelDelegate* kHuixuanChannelDelegate = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        kHuixuanChannelDelegate = [[HuixuanChannelDelegate alloc] init];
//    });
//    return kHuixuanChannelDelegate;
//}

-(void)initAhead{

    
//    NSString *TTappid = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"longgu_TTappid"];
//    NSString *TTappname = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"longgu_TTappname"];
//    [TTTracker startWithAppID:TTappid channel:@"AppStore" appName:TTappname];
}

- (void)initSDK{

    // 初始化SDK所需要的游戏id等
 
    
    [[QiLiSDK shareInstance] initSDKWithGameID:@"337" secretKey:@"8f84ff522e5a4360ae66eabc96a4de58" delegate:self];

}

- (void)login:(NSDictionary *)param_dic onSuccess:(void (^)(NSDictionary *))onSuccess onFailed:(void (^)(NSError *))onFailed{
    NSLog(@"Xiaoqi Channel Delegate >> login()");
    
    //存储回调对象
    self.loginSuccess = onSuccess;
    self.loginFailure = onFailed;
    
    

    [[QiLiSDK shareInstance] showLoginView];
//    [SMSDK smLogin];
    

}

- (void)pay:(NSDictionary *)param_dic onSuccess:(void (^)(NSString *))onSuccess onFailed:(void (^)(NSError *))onFailed onCancel:(void (^)(NSError *))onCancel {
    NSLog(@"Xiaoqi Channel Delegate >> pay(), params:%@", param_dic);
    
    self.paySuccess = onSuccess;
    self.payFailed = onFailed;
   
 
    
       NSString *productPrice = [param_dic objectForKey:YWGame_PayParam_ProductPrice];     //以分为单位
        float finalPriceYuan = [productPrice floatValue] ; //元
                NSString *finalPriceStr = [NSString stringWithFormat:@"%.2f", finalPriceYuan];
    
     finalPriceYuan = [finalPriceStr floatValue];
    
    NSString *uesrId=[param_dic objectForKey:YWGame_PayParam_UserID];
    

    QLProductInfo *info = [[QLProductInfo alloc] init];
    info.userID =[param_dic objectForKey:YWGame_PayParam_UserID];
    info.roleID = [param_dic objectForKey:YWGame_PayParam_RoleID];
    info.serverID = [param_dic objectForKey:YWGame_PayParam_ServerID];//区服id
    info.cpOrder = @"asdfasdfasdf";
    info.produceName = [param_dic objectForKey:YWGame_PayParam_ProductName];//产品名称
    info.productDesc =  [param_dic objectForKey:YWGame_PayParam_ProductDesc];//产品描述
    info.price = [NSNumber numberWithFloat:finalPriceYuan];//价格,单位为分
    info.cpData = @"";//透传参数
    info.roleName =[param_dic objectForKey:YWGame_PayParam_RoleName];//角色名称
    info.roleLevel =[param_dic objectForKey:YWGame_PayParam_RoleLevel];
    [[QiLiSDK shareInstance] payWithPayModel:info];
    
    
}

#pragma mark - 登出
- (void)logout:(void (^)(NSString *))onSuccess onFailed:(void (^)(NSError *))onFailed{
    NSLog(@"Longgu logout()");
    
    self.logoutSuccess = onSuccess;
    self.logoutFailed = onFailed;
    


}
-(void)setOnLogoutCompleteListener:(void (^)(NSString *result))onSuccess
{
    self.sdkLogoutSuccess = onSuccess;
}

#pragma mark - 上报角色信息
- (void)setExtraData:(int)eventType RoleInfo:(NSDictionary *)roleInfo{
    NSLog(@"Youlong setExtraData()");

//
    if (eventType ==ExtraData_Event_CreateRole ) {//创建角色
        eventType=2;
    } else if (eventType == ExtraData_Event_StartPlay) {//选服进入游戏
        eventType=1;
    } else if (eventType == ExtraData_Event_LevelUp) {//角色升级
        eventType=3;
    }
    else if (eventType == ExtraData_Event_LoginOut) {//角色升级
        eventType=4;
    }


    NSString *Roletype=[NSString stringWithFormat:@"%d",eventType];
    
    NSString *serverID=roleInfo[@"serverId"];
    
    QLRoleDataInfo *role = [[QLRoleDataInfo alloc] init];
    role.userID = [roleInfo objectForKey:@"uesrId"];//用户id
    role.serverID = [roleInfo objectForKey:@"serverId"];;//区服id
    role.serverName = [roleInfo objectForKey:@"serverName"];;//区服名称
    role.roleName = [roleInfo objectForKey:@"roleName"];;//角色名称
    role.roleLevel = [roleInfo objectForKey:@"roleLevel"];;//角色等级
    role.roleID = [roleInfo objectForKey:@"roleId"];;//角色id
    role.remark =[roleInfo objectForKey:@"remark"];;//其他信息，无可传@“”
    [[QiLiSDK shareInstance] submitUserInfo:role];

      
}

#pragma mark -------<QiLiSDKDelegate>代理方法---------------
-(void)qiliSDKLoginSuccess:(QLUserInfo *)userInfo {
    NSLog(@"登陆成功");
    
    NSDictionary* dic=@{@"tokenkey":userInfo.token,@"userId":userInfo.userid};
    
    self.loginSuccess(dic);
    
    NSLog(@"userInfo--%@",userInfo);
//    _userInfo = userInfo;
}

// 登出回调
-(void)qiliSDKLogout{
    
    if (self.sdkLogoutSuccess) {
        self.sdkLogoutSuccess(@"Longgu logout");
    }
}





//#pragma mark - 第三方跳转接口
//// TODO: 必接代碼開始
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//
//    return [ZQSDKManager ZQ_application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
//}
//
//// NOTE: iOS 9.0以後使用
//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
//
//
//    return [ZQSDKManager ZQ_application:app openURL:url sourceApplication:options[@"UIApplicationOpenURLOptionSourceApplicationKey"] annotation:[[NSNull alloc] init]];
//}




- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
  
    return YES;
    
    
}


- (void)logutOut {
    NSLog(@"Longgu logout out");
    
    if (self.logoutSuccess) {
        self.logoutSuccess(@"Longgu logout");
    }
}

@end

