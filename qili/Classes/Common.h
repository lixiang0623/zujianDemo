//
//  Common.h
//  xiaoqi_Example
//
//  Created by 李瑞 on 2023/3/21.
//  Copyright © 2023 lirui. All rights reserved.
//

#ifndef Common_h
#define Common_h

//支付需要传入的参数列表 [CP看]
#define YWGame_PayParam_ProductDesc @"productDesc"    //商品描述
#define YWGame_PayParam_CPOrderId @"cpOrderId"
#define YWGame_PayParam_ProductName @"productName"  //商品名
#define YWGame_PayParam_ProductDes @"productDes"  //商品描述
#define YWGame_PayParam_ProductPrice @"productPrice"    //价格，单位为分
#define YWGame_PayParam_ProductCount @"productCount"
#define YWGame_PayParam_ProductID @"productId"      //商品 id(productID 为苹果后台申请的商品 ID)
#define YWGame_PayParam_CallbackInfo @"callbackInfo"    //透传参数
#define YWGame_PayParam_ServerID @"serverId"    //区服ID
#define YWGame_PayParam_ServerName @"serverName"    //区服ID
#define YWGame_PayParam_RoleLevel @"roleLevel"  //角色等级
#define YWGame_PayParam_VIPLevel @"vipLevel"    //VIP等级
#define YWGame_PayParam_RoleID @"roleId"    //角色ID
#define YWGame_PayParam_RoleName @"roleName"    //角色名称

#define YWGame_PayParam_CurrencyName @"currencyName"    //货币名
#define YWGame_PayParam_RoleType @"roleType"    //角色类型
#define YWGame_PayParam_UserID @"userID"    //用户id

//支付用到的参数 [YWSDK新增，CP不需要传入这些]
#define YWGame_PayParam_YWOrderId @"ywOrderId"
#define YWGame_PayParam_YWOpenId @"ywOpenId"

//上报游戏数据接口常量（setExtraData）
//需要上报游戏数据的场景
#define ExtraData_Event_StartPlay 1     //进入游戏事件
#define ExtraData_Event_CreateRole 2    //创建角色事件
#define ExtraData_Event_LevelUp 3       //角色升级事件
#define ExtraData_Event_LoginOut 4       //退出游戏事件


//需要上报的具体的游戏数据
#define ExtraData_RoleID @"roleId"          //角色ID
#define ExtraData_RoleName @"roleName"      //角色名称
#define ExtraData_RoleLevel @"roleLevel"    //角色等级
#define ExtraData_RolePower @"rolePower"    //角色战斗力
#define ExtraData_ServerId @"serverId"      //区服ID
#define ExtraData_ServerName @"serverName"  //区服名称
#define ExtraData_CreatRoleTime @"creatRoleTime"  //创建时间

#define ExtraData_RolelevelMtime @"rolelevelMtime"  //角色等级变化时间

#define ExtraData_VipLevel @"vipLevel"          //玩家vip等级
#define ExtraData_GameUserBalance @"gameUserBalance"          //玩家虚拟货币余额
#define ExtraData_PartyName @"partyName"          //工会名


#endif /* Common_h */
