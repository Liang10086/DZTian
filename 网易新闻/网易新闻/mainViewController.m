//
//  mainViewController.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/19.
//  Copyright © 2016年 china. All rights reserved.
//

#import "mainViewController.h"
#import "SSSSSSSmodel.h"
#import "UICCollectionViewCell.h"
@interface mainViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIScrollView *MyScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *MyCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *MyCollectionViewFlowLayout;

//接收模型数据的数组
@property (strong, nonatomic)NSArray *array;

//标签数组
@property (strong, nonatomic)NSMutableArray *labM;

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化 cell 的尺寸
    self.MyCollectionViewFlowLayout.itemSize = self.MyCollectionView.frame.size;

    [self uploadLabel];
    
}
#pragma
#pragma mark -- 懒加载
- (NSMutableArray *)labM{

    if (_labM == nil) {
        _labM = [NSMutableArray array];
    }

    return _labM;
}

- (NSArray *)array{
    if (_array == nil) {
        _array = [SSSSSSSmodel array];
    }

    return _array;
}

#pragma
#pragma mark -- 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{


    UICCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    SSSSSSSmodel *model = self.array[indexPath.item];
    
    NSString *url = [NSString stringWithFormat:@"article/list/%@/0-20.html",model.tid];
    
    cell.url = url;
    
    return cell;
}


#pragma
#pragma mark -- 循环创建 label

- (void)uploadLabel{
    
    //MARK: 当 UIScrollView 和他的子类,遇到导航控制器的时候,里面的内容会自动的向下偏移64个像素
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGFloat W = 80;
    
    CGFloat H = self.MyScrollView.frame.size.height;
    
    for (int i = 0; i < self.array.count; i ++) {
        
        UILabel *label = [[UILabel alloc]init];
        //设置 label 位置
        label.frame = CGRectMake(W * i, 0, W, H);
        //添加到 scrollView 里边
        [self.MyScrollView addSubview:label];
        
        SSSSSSSmodel *model = self.array[i];

        label.text = model.tname;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        self.MyScrollView.contentSize = CGSizeMake(W * self.array.count, 0);
        
   //MARK: 实现点击频道方法
        //给每个 label 设置 tag
        label.tag = i;
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        [label addGestureRecognizer:tap];
        
        //设置 lab 可以点击
        label.userInteractionEnabled = YES;
        
        //把 label 添加到频道数组里面
        [self.labM addObject:label];
        
    }
    

}

#pragma
#pragma mark -- 点击频道的方法 实现
- (void)tapClick:(UIGestureRecognizer *)tap{

    //获取选中的 label;
    UILabel *label = (UILabel *)tap.view;

    //计算选中的label 要滚动的偏移量
    CGFloat labelX = label.center.x - self.view.bounds.size.width * 0.5;
    
    
    CGFloat Min = 0;
    
//    CGFloat max = self.MyScrollView.bounds.size.width - self.view.bounds.size.width ;
    
    CGFloat Max = self.MyScrollView.contentSize.width - self.view.bounds.size.width;
    if (labelX < Min) {
        labelX = 0;
    }else if(labelX > Max){
        labelX = Max;
    }
//    NSLog(@"偏移量 == %f",labelX);
 
    [self.MyScrollView setContentOffset:CGPointMake(labelX, 0) animated:YES];

//MARK: 点击频道标签居中的时候 collectionView也跟着联动
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:label.tag inSection:0];
    
    [self.MyCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:YES];

}

#pragma
#pragma mark -- 监听底部 conllectionView 滚动::: 滚动结束的代理方法

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    //计算滚动到第几个索引
    NSInteger index = scrollView.contentOffset.x /scrollView.bounds.size.width;
    
    //根据标签去找 label
    UILabel *label = self.labM[index];
    
    //计算选中的label 要滚动的偏移量
    CGFloat labelX = label.center.x - self.view.bounds.size.width * 0.5;
    
    
    CGFloat Min = 0;
   
    CGFloat Max = self.MyScrollView.contentSize.width - self.view.bounds.size.width;
   
    if (labelX < Min) {
        labelX = 0;
    }else if(labelX > Max){
        labelX = Max;
    }
    //    NSLog(@"偏移量 == %f",labelX);
    
    [self.MyScrollView setContentOffset:CGPointMake(labelX, 0) animated:YES];
    


}

@end
