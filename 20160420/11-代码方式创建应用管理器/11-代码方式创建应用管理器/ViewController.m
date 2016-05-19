//
//  ViewController.m
//  11-代码方式创建应用管理器
//
//  Created by 小太阳 on 16/2/14.
//  Copyright © 2016年 小太阳. All rights reserved.
//



//应用管理器cell上有imageView 而且有label 并且是圆角的  所以必须设置cell的contentView 那么久要自定义一个cell 

#import "ViewController.h"
#import "AppCell.h"
#import "AppModel.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSArray *dataArr;
@end
static NSString *identifier = @"collView";
@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    实例化一个layout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    改变cell的大小
    flowLayout.itemSize = CGSizeMake(100, 100);
//    修改cell距离view的边距
    flowLayout.sectionInset = UIEdgeInsetsMake(40, 10, 0, 10);
//    实例化一个collectionView
 UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    [self.view addSubview:collectionView];
//    注册cell
    [collectionView registerClass:[AppCell class] forCellWithReuseIdentifier:identifier];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    

}
#pragma mark 数组的懒加载
-(NSArray *)dataArr
{
    
    if (_dataArr == nil) {
        //    路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"App.plist" ofType:nil];
        //    读取
        NSArray *arr = [[NSArray alloc]initWithContentsOfFile:path];
        //    转换
        NSMutableArray *tempArr = [NSMutableArray array];
        
        
        for (NSDictionary *dict in arr) {
            AppModel *model = [[AppModel alloc]initWithDictionary:dict];
            [tempArr addObject:model];

        }
        
        //    赋值
        _dataArr = tempArr;

    }
    return _dataArr;
    
    
}
#pragma mark collectionView dataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArr.count;

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    从缓存池中取出
    AppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    取出cell.model
    AppModel *model = _dataArr[indexPath.item];
    cell.appModel = model;
    return cell;
}
@end
