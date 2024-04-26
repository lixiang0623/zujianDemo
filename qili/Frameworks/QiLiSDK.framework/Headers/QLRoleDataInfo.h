//
//  QLRoleDataInfo.h
//  QiLiSDK
//
//  Created by 刘落星 on 2021/5/6.
//  Copyright © 2021 Star. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QLUserInfo : NSObject

@property (nonatomic, copy) NSString *userName;//账号
@property (nonatomic, copy) NSString *userid;//用户id
@property (nonatomic, copy) NSString *token;//登录token值

@end

@interface QLRoleDataInfo : NSObject

@property (nonatomic, copy) NSString *userID;//用户id
@property (nonatomic, copy) NSString *userName;//用户名
@property (nonatomic, copy) NSString *serverID;//区服id
@property (nonatomic, copy) NSString *serverName;//区服名称
@property (nonatomic, copy) NSString *roleID;//角色id
@property (nonatomic, copy) NSString *roleName;//角色名称
@property (nonatomic, copy) NSString *roleLevel;//角色等级
@property (nonatomic, copy) NSString *remark;//其他信息

@end

NS_ASSUME_NONNULL_END
