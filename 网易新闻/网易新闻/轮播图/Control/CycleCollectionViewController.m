//
//  CycleCollectionViewController.m
//  网易新闻
//
//  Created by 王明亮 on 16/7/22.
//  Copyright © 2016年 china. All rights reserved.
//

#import "CycleCollectionViewController.h"
#import "CycleModel.h"
#import "CycleUICCollectionViewCell.h"

@interface CycleCollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (strong, nonatomic)UIPageControl *pageConntrol;

@property (strong, nonatomic)NSArray *arr;

@end

@implementation CycleCollectionViewController


#pragma
#pragma mark -- 设置 cell 大小
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    [self pageConntroller];
    
    //设置 cell 的大小
    self.flowLayout.itemSize = self.collectionView.bounds.size;
}

#pragma
#pragma mark -- 创建 pagecontrol
- (void)pageConntroller{
    self.pageConntrol = [[UIPageControl alloc]init];
    //添加到视图
    [self.view addSubview:self.pageConntrol];
     //选中颜色
    self.pageConntrol.currentPageIndicatorTintColor = [UIColor redColor];
    //未选中颜色
    self.pageConntrol.pageIndicatorTintColor = [UIColor blueColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    [self loadModelData];
    

 
}
#pragma
#pragma mark -- 下载数据

- (void)loadModelData{

    [CycleModel loadCycleDataWithUrl:@"ad/headline/0-4.html" successBlock:^(NSArray *listArr) {
       
        self.arr = listArr;
        //刷新 ui
        [self.collectionView reloadData];
       
 //MARK: 配置 pagecontrol
        //设置个数,跟图片的个数相同
        self.pageConntrol.numberOfPages = self.arr.count;
        //获取 pagecontrol 的size
        CGSize pageControlSize = [self.pageConntrol sizeForNumberOfPages:self.arr.count];
//        NSLog(@"pageControlSize = %d",pageControlSize);
        //pageControl 的 frame
        CGFloat pageControlX = self.view.bounds.size.width - pageControlSize.width - 10 ;
        CGFloat pageControlY = self.view.bounds.size.height - pageControlSize.height - 25;
        self.pageConntrol.frame = CGRectMake(pageControlX, pageControlY, pageControlSize.width, pageControlSize.height);
        
    } failBlock:^(NSError *error) {
        
     
    }];

}

#pragma mark 数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.arr.count * 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString * const reuseIdentifier = @"Cell";
    
    CycleUICCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    CycleModel *model =self.arr[indexPath.item%self.arr.count];
    
    cell.model = model;
    
    
    return cell;
}

#pragma
#pragma mark -- 滚动结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    //计算当前在第几个图片
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    NSLog(@"index %ld",(long)index);
//MARK: 设置 pageontrol 跟着滚动
    self.pageConntrol.currentPage = index%self.arr.count;
    
    
    //准备索引
    NSIndexPath *indexpath;
    //重新获取图片总个数: 因为前边加倍了
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    //滚动到最前面的情况
    if (index == 0) {
    
        indexpath = [NSIndexPath indexPathForItem:self.arr.count inSection:0];
        NSLog(@"indexpath1111 = %@",indexpath);
    }else if(index == items - 1){
    
        //滚动到最后面的情况
        indexpath = [NSIndexPath indexPathForItem:self.arr.count - 1 inSection:0];
        NSLog(@"indexpath22222 = %@",indexpath);

    }

    //滚动 collectionView
    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:0 animated:NO];
    
}



@end
