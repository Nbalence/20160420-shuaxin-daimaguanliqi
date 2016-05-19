//
//  AppCell.h
//  11-代码方式创建应用管理器
//
//  Created by 小太阳 on 16/2/14.
//  Copyright © 2016年 小太阳. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppModel;
@interface AppCell : UICollectionViewCell
@property(nonatomic,strong)AppModel *appModel;
@end
