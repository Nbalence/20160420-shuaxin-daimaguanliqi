//
//  AppModel.m
//  11-代码方式创建应用管理器
//
//  Created by 小太阳 on 16/2/14.
//  Copyright © 2016年 小太阳. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel
//初始化方法实现

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)AppModelInitWithDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
    
}


@end
