//
//  AppCell.m
//  11-代码方式创建应用管理器
//
//  Created by 小太阳 on 16/2/14.
//  Copyright © 2016年 小太阳. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"
@interface AppCell ()
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *namelabel;
@end
@implementation AppCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        设置cell的背景色
//        self.backgroundColor = [UIColor redColor];

//        设置cell的contenView
        CGSize cellSize = self.contentView.frame.size;
        CGFloat iconWidth = cellSize.width *0.6;
        CGFloat iconX = (cellSize.width-iconWidth)/2;
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(iconX, 0, iconWidth, iconWidth)];
//        对属性进行赋值
        self.iconImageView = imageView;
        [self.contentView addSubview:imageView];
        
//        创建label
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), cellSize.width, 20)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:17];
        label.text = @"爸爸去哪儿";
        self.namelabel = label;
        [self.contentView addSubview:label];
        
        
        
        
    }
    return self;

}
-(void)setAppModel:(AppModel *)appModel
{
//    先赋值
    _appModel = appModel;
    
//    给子控件赋值
    _iconImageView.image = [UIImage imageNamed:appModel.icon];
    _namelabel.text = appModel.name;
    
    
    
    

}
@end
