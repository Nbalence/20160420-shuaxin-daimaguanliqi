//
//  AppModel.h
//  11-代码方式创建应用管理器
//
//  Created by 小太阳 on 16/2/14.
//  Copyright © 2016年 小太阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject

@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *name;


-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)AppModelInitWithDictionary:(NSDictionary *)dict;

@end
